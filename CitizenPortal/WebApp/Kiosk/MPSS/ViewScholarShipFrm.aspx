<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewScholarShipFrm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.ViewScholarShipFrm" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement For Enrollment form Admission</title>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/CommonScript.js"></script>--%>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        .hdbg {
            background-color: #383E4B;
            color: #fff;
        }

        .sub_hdbg {
            background-color: #F8F8F8;
            color: #383E4B;
            font-weight: bold;
        }

        .t_trans {
            text-transform: capitalize;
        }
    </style>

       <script src="../../../Scripts/jquery-2.2.3.js"></script>
    <script src="../../../Scripts/angular.min.js"></script>
    <link href="../../../Sambalpur/css/bootstrap.min.css" rel="stylesheet" />
     <script src="/WebApp/Scripts/ServiceLanguage.js?ver=1.1"></script>
    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {


            var t_Lang = p_Lang;

            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;



            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";

            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>
    <script type="text/javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=860,height=2010,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
        function CallHome(strid) {
            var url = "/WebApp/Kiosk/MPSS/MPSSReports.aspx";
            window.location.href = url;
            window.location.assign(url);
            window.location = url;
            window.location.replace = url;
            return false;
        }
        function CreateDialog(src, FileName) {
            var dialog = '<div  title="' + FileName + '" style="overflow:hidden;">';
            dialog += '<iframe  src="' + src + '" height="100%" width="100%"></iframe>';
            dialog += '</div>';
            console.log(dialog);
            $(dialog).dialog({ width: '890', height: '600' });

        }

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path;//+ "&SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">       

                        <div class="col-md-12 box-container" runat="server" id="div1">


                            <span class="col-lg-12 p0 pull-right " style="font-size: 15px; margin-top:10px ">Choose Language:
                           
                                <input type="button" id="btnLang" clientidmode="Static" class="btn-link" style="height: 25px; color: #820000;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i>
                            </span>
                            <span class="clearfix"></span>

                        </div>
        <div class="box-body box-body-open">
            <div id="divPrint" style="margin: 0 auto; width: 100%;">
                <div style="width: 850px; margin: 0 auto; height: auto; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="width: 100%; margin: 0 auto; height: auto; border: 1px solid #000; background-image: url(''); background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                        <%---------Start Header section --------%>
                        <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                            <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                                <tr>
                                    <td>
                                        <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                            <img alt="Logo" src="/../../PortalImages/MPLogo.png" style="width: 85px; margin: 16px 0px 0px 33px;" />
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center"> MAHARSHI PATANJALI SANSKRIT SANSTHAN <br />महर्षि पतंजलि संस्कृत संस्थान, भोपाल,
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <div style="width: 165px; float: right; margin: 5px 0 0 5px">
                                            <img alt="Logo" src="/Sambalpur/img/DigiVarsity.png" style="width: 100px; margin: 16px 33px 0 15px;" />

                                        </div>
                                    </td>
                                </tr>
                            </table>


                        </div>

                    </div>
                    <div class="container-fluid p0" id="intrnlContent" ng-app="appmodule">
                        <div ng-controller="ctrl">

                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <%-- <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>ScholarShip Form</h2>
            </div>
        </div>--%>


                            <div id="page-wrapper" style="min-height: 500px !important;">
                                <div class="row">
                                    <div class="col-md-12 box-container" runat="server" id="div5">

                                        <div class="box-heading form_hd">
                                            <div class="box-heading form_hd">
                                                <h2>{{resourcesData.lblScName}}</h2>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-12">
                                        <div class="alert alert-success">
                                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                                        </div>
                                    </div>
                                </div>





                                <div class="box-body box-body-open">



                                    <div id="step-1">
                                        <div class="row">
                                            <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblScStDtls}}</legend>
                                                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 box-container row">
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">

                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblStSamagraID}}</label>
                                                            <%--<asp:DropDownList ID="ddlStudenID" runat="server" CssClass="form-control">
                            </asp:DropDownList>--%>



                                                            <asp:TextBox Enabled="false" ID="txtSamagraID" onChange="SamagaraVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="9"></asp:TextBox>

                                                            <%-- <ajaxToolkit:ComboBox ID="ddlStudenID" runat="server"
                                                        AutoPostBack="true"
                                                        DropDownStyle="DropDownList"
                                                        AutoCompleteMode="SuggestAppend"
                                                        CaseSensitive="False"
                                                        CssClass=""
                                                        ItemInsertLocation="Append" OnSelectedIndexChanged="ddlStudenID_SelectedIndexChanged" />--%>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSamagraID" Display="Dynamic"
                                                                    ErrorMessage="Please enter Samagra No" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">

                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblFamilySamagra}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtFamilySamagraID" onChange="SamagaraFamilyVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="9"></asp:TextBox>


                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFamilySamagraID" Display="Dynamic"
                                                                    ErrorMessage="Please enter Family SamagraID No" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.aadhaar}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtAadhar" onChange="AadharVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="12"></asp:TextBox>


                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAadhar" Display="Dynamic"
                                                                    ErrorMessage="Please enter Aadhar No" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStName}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtStudentName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStudentName" Display="Dynamic"
                                                                    ErrorMessage="Please enter Student name in English" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStNameHindi}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtStudentHindiName" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtStudentHindiName" Display="Dynamic"
                                                                    ErrorMessage="Please enter Student Name in Hindi" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblStGender}}</label>
                                                            <asp:DropDownList Enabled="false"  ID="ddlGender" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                            </asp:DropDownList>


                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                                                    ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblStDOB}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtBirthdate" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                                                onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();">
                                                            </asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBirthdate" InitialValue="" Display="Dynamic"
                                                                    ErrorMessage="Please select Birth Date." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStClass}}</label>
                                                            <asp:DropDownList Enabled="false"  ID="ddlClass" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                            </asp:DropDownList>

                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlClass" Display="Dynamic"
                                                                    ErrorMessage="Please Enter Class" ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>


                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStSection}} </label>

                                                            <asp:DropDownList Enabled="false"  ID="ddlSection" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                            </asp:DropDownList>

                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlSection" Display="Dynamic"
                                                                    ErrorMessage="Please College Section." ValidationGroup="G" ForeColor="Red" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStSchool}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtSchool" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School"></asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSchool" Display="Dynamic"
                                                                    ErrorMessage="Please Enter School." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStSubject}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Subject"></asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSubject" Display="Dynamic"
                                                                    ErrorMessage="Please Enter Subject." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStFather}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtFatherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                                                    ErrorMessage="Please enter Father's Name." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStFatherOcc}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtFatherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtFatherOcc" Display="Dynamic"
                                                                    ErrorMessage="Please enter Father's Occupation." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                        <label>
                                                            {{resourcesData.lblScStFatherDead}}
                                        
                                                        </label>

                                                       <asp:CheckBox Enabled="false"  ID="IsFatherDead" runat="server" />

                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory">{{resourcesData.lblScStMother}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtMotherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                            <div class="col-xs-12 pleft0">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                                    ErrorMessage="Please enter Mother's Name." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                        <div class="form-group">
                                                            <label>{{resourcesData.lblScStMotherOcc}}</label>
                                                            <asp:TextBox Enabled="false" ID="txtMotherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtMotherOcc" Display="Dynamic"
                                    ErrorMessage="Please enter Mother's Occupation." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                                        <div class="form-group">
                                                            <label class="manadatory">
                                                                {{resourcesData.lblPassExam}}
                                                            </label>


                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="rbnpass1" runat="server" Text="Yes" GroupName="pass" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">

                                                            <asp:RadioButton Enabled="false"  ID="rbnpass2" runat="server" Text="No" GroupName="pass" Checked="true" />
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>


                                                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                                                    <div id="divPhoto" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">{{resourcesData.lblStUpload}}
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" Style="height: 180px" ID="myImg" />
                                                                <input class="camera" id="File1" name="Photoupload" type="file" runat="server" />
                                                                <asp:Button ID="btnPhoto" type="submit" Text="Upload" runat="server"></asp:Button>
                                                                <asp:Panel ID="frmConfirmationPhoto" Visible="False" runat="server">
                                                                    <asp:Label ID="lblUploadResultPhoto" runat="server"></asp:Label>
                                                                </asp:Panel>

                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <div id="divTC" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">{{resourcesData.lblStTCUpload}}
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                {{resourcesData.lblStTCUpload}}                                        
                                                        <asp:Image runat="server" class="form-control" name="ProfilePhoto" ID="ImageTC" src="/webApp/kiosk/Images/tc.bmp" Style="height: 100px" />
                                                                <input id="oFile" type="file" runat="server" name="oFile" />
                                                                <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server"></asp:Button>
                                                                <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                                                    <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="clearfix"></div>
                                        </div>
                                        <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                                    </div>
                                    <div id="step-2">
                                        <fieldset>
                                            <legend>&nbsp {{resourcesData.lblStApplicantAddress}}</legend>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        {{resourcesData.lblStHouseNo}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                            ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        {{resourcesData.lblStColony}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                                            ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        {{resourcesData.lblStCity}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                            ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        {{resourcesData.lblStBlock}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                                            ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        {{resourcesData.lblStDistrict}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtDistrict" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        {{resourcesData.lblStPinCode}}
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                            ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                        </fieldset>

                                        <br />

                                        <div class="clearfix"></div>
                                        <%---Start of Button----%>
                                    </div>
                                    <div id="step-3">
                                        <fieldset id="divStudentIfo" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp {{resourcesData.lblScStInform}}</legend>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStFIncome}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtFamiyIncome" CssClass="form-control" runat="server" MaxLength="8" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFamiyIncome" Display="Dynamic"
                                                            ErrorMessage="Please enter Family Income." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStCaste}}</label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlCaste" runat="server" CssClass="form-control">
                                                        <%-- <asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlCaste" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select Category." ValidationGroup="G" ForeColor="Red" />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStSubCaste}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtSubCaste" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSubCaste" Display="Dynamic"
                                    ErrorMessage="Please enter Sub Cast." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStDigitalCasteNo}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDigitalCasteNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDigitalCasteNo" Display="Dynamic"
                                    ErrorMessage="Please enter Digital Caste Cetrtificate Number." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStReligion}}</label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlReligion" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="1">Hindu</asp:ListItem>
                                                        <asp:ListItem Value="2">Muslim</asp:ListItem>
                                                        <asp:ListItem Value="3">Sikh</asp:ListItem>
                                                        <asp:ListItem Value="4">Christian</asp:ListItem>
                                                        <asp:ListItem Value="999 Private">Traditional Private</asp:ListItem>
                                                    </asp:DropDownList>


                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlReligion" Display="Dynamic"
                                                            ErrorMessage="Please enter Regilion." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStNative}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsMPOrigin" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="IsMPOriginY" runat="server" Text="Yes" GroupName="IsMPOrigin" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="IsMPOriginN" runat="server" Text="No" GroupName="IsMPOrigin" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblStHostelName}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtHostelName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display: none;">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblStCurrSchCls}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtSchoolEntryCls" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblStCurrSchCls}} </label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlCuurentSchoolName" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblDiceCode}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDiceCode" onChange="DiceCode();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="11"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblSambathaCode}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtSambathaCode" onChange="SambathaCode();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="4"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblStudyClass}} </label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlCuurentClass" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblPreStudyClass}}  </label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlPreviousClass" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblAllSub}} </label>
                                                    <%--  <asp:TextBox Enabled="false" ID="txtAllSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>--%>

                                                    <asp:DropDownList Enabled="false"  ID="ddlAllSubject" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblPreAllSub}} </label>
                                                    <%--<asp:TextBox ID="txtPreAllSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>--%>
                                                    <asp:DropDownList Enabled="false"  ID="ddlPreAllSubject" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                    </asp:DropDownList>


                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display: none;">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblDetached}} </label>
                                                    <asp:TextBox Enabled="false" ID="txtDetached" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display: none;">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblDetachedPercentage}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDetachedPer" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblDetachedPercentageEqp}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDetachedPerEqp" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblDetachedPercentageEscort}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDetachedPerEscort" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStExamBoardName}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtExamBoardName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStMonthlyFee}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtMonthlyFee" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                    <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtMonthlyFee" Display="Dynamic"
                                    ErrorMessage="Please enter MonthlyFee." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>




                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrSch}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDateAdmisCurrSch" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtDateAdmisCurrSch" Display="Dynamic"
                                                            ErrorMessage="Please enter Date of admission in current school." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrClass}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtDateAdmisCurrClass" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtDateAdmisCurrClass" Display="Dynamic"
                                                            ErrorMessage="Please enter Date of Admission to class (DD/MM/YYYY)." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStNoOfSibling}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtNoOfSibling" CssClass="form-control" runat="server" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtNoOfSibling" Display="Dynamic"
                                                            ErrorMessage="Please enter How many brothers/sisters." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStAdmissionNo}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtAdmissionNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtAdmissionNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Student's School admission number." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCurrentCls}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtCurrentCls" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtCurrentCls" Display="Dynamic"
                                    ErrorMessage="Please enter Current Class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStLastCls}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtLastCls" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtLastCls" Display="Dynamic"
                                    ErrorMessage="Please enter Last year's class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStPreAttDays}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtPreAttDays" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtPreAttDays" Display="Dynamic"
                                    ErrorMessage="Please enter Student's attendance day in the previous year." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStMediums}}</label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlMedium" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="S">Sanskrit</asp:ListItem>
                                                        <asp:ListItem Value="H">Hindi</asp:ListItem>
                                                        <asp:ListItem Value="E">English</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="ddlMedium" Display="Dynamic"
                                                            ErrorMessage="Please enter Student's medium of instruction." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="FatherName">{{resourcesData.lblScStDisability}} </label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlDisAbility" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="ddlDisAbility" InitialValue="0" Display="Dynamic"
                                                        ErrorMessage="Please select Disability." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                            <div id="divDisAble" style="display: none;">
                                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="FatherName">{{resourcesData.lblDisavbiType}}  </label>
                                                        <asp:DropDownList Enabled="false"  ID="ddlDisAbilityType" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="V">दृष्टिबाधित</asp:ListItem>
                                                            <asp:ListItem Value="O">अस्थिबाधित</asp:ListItem>
                                                            <asp:ListItem Value="H">श्रवणबाधित</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                    <div class="form-group">
                                                        <label>{{resourcesData.lblDetachedPercentage}}</label>
                                                        <asp:TextBox Enabled="false" ID="TextBox1" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                        <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStEquipDisability}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtEquipDisability" CssClass="form-control" runat="server"></asp:TextBox>


                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStFreeUniform}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtFreeUniform" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtFreeUniform" Display="Dynamic"
                                    ErrorMessage="Please enter FreeUniform." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStYrLastExam}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtYrLastExam" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtYrLastExam" Display="Dynamic"
                                    ErrorMessage="Please enter Year of last class exam." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStLastAnnualResult}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtLastAnnualResult" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtLastAnnualResult" Display="Dynamic"
                                    ErrorMessage="Please enter last annual result." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStPassPercentage}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtPassPercentage" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtPassPercentage" Display="Dynamic"
                                    ErrorMessage="Please enter Pass Percentage." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStStudentStatus}}</label>
                                                    <asp:DropDownList Enabled="false"  ID="ddlStatus" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="P">Pass</asp:ListItem>
                                                        <asp:ListItem Value="F">Fail</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="ddlStatus" Display="Dynamic"
                                                            ErrorMessage="Please enter StudentStatus." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStLastClsInt}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtLastClsInt" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtLastClsInt" Display="Dynamic"
                                    ErrorMessage="Please enter Name of last class institution." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCodeFacultySt}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtCodeFacultySt" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtCodeFacultySt" Display="Dynamic"
                                    ErrorMessage="Please enter >Code of Faculty/Stream." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCodeTradeVocationalPrg}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtCodeTradeVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="txtCodeTradeVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Code of trade taken by the student in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStTypeJobRoleVocationalPrg}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtTypeJobRoleVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="txtTypeJobRoleVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter What type of job roles are expected in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStLvlNSFQ}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtLvlNSFQ" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtLvlNSFQ" Display="Dynamic"
                                    ErrorMessage="Please enter >Which level of NSFQ has been completed by the student?." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStObjVocationalPrg}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtObjVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtObjVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Objectives of student to take vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStJobStaus}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtJobStaus" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtJobStaus" Display="Dynamic"
                                    ErrorMessage="Please enter Job / Placement Status." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStJobSalary}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtJobSalary" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtJobSalary" Display="Dynamic"
                                    ErrorMessage="Please enter JobSalary." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStMobieNoParent}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtMobieNoParent" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtMobieNoParent" Display="Dynamic"
                                                            ErrorMessage="Please enter MobieNo Parent." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStLadliLaxmiNo}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtLadliLaxmiNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtLadliLaxmiNo" Display="Dynamic"
                                    ErrorMessage="Please enter Ladli Laxmi No." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="clearfix"></div>
                                        <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                                    </div>
                                    <div id="step-4">
                                        <fieldset id="divStudentOther" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp {{resourcesData.lblScStInformation}}</legend>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStParentIcomeTaxPayer}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsParentIcomeTaxPayer" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton29" runat="server" Text="Yes" GroupName="IsParentIcomeTaxPayer" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton30" runat="server" Text="No" GroupName="IsParentIcomeTaxPayer" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsAnyHaveScholarShip}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsAnyHaveScholarShip" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton27" runat="server" Text="Yes" GroupName="IsAnyHaveScholarShip" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton28" runat="server" Text="No" GroupName="IsAnyHaveScholarShip" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsHosteller}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsHosteller" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton25" runat="server" Text="Yes" GroupName="IsHosteller" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton26" runat="server" Text="No" GroupName="IsHosteller" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsFamilyBPL}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsFamilyBPL" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="IsFamilyBPLY" runat="server" Text="Yes" GroupName="IsFamilyBPL" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="IsFamilyBPLN" runat="server" Text="No" GroupName="IsFamilyBPL" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsDisadvantagedgroup}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsDisadvantagedgroup" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton1" runat="server" Text="Yes" GroupName="IsDisadvantagedgroup" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton2" runat="server" Text="No" GroupName="IsDisadvantagedgroup" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsRTE}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsRTE" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton3" runat="server" Text="Yes" GroupName="IsRTE" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton4" runat="server" Text="No" GroupName="IsRTE" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsClsFirstEnrollStatus}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsClsFirstEnrollStatus" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton5" runat="server" Text="Yes" GroupName="IsClsFirstEnrollStatus" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton6" runat="server" Text="No" GroupName="IsClsFirstEnrollStatus" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsDGSCaste}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsDGSCaste" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton7" runat="server" Text="Yes" GroupName="IsDGSCaste" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton8" runat="server" Text="No" GroupName="IsDGSCaste" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsFreeTextbooks}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsFreeTextbooks" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton9" runat="server" Text="Yes" GroupName="IsFreeTextbooks" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton10" runat="server" Text="No" GroupName="IsFreeTextbooks" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsFreeTransport}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsFreeTransport" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton11" runat="server" Text="Yes" GroupName="IsFreeTransport" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton12" runat="server" Text="No" GroupName="IsFreeTransport" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScSIsFreeEscortDis}}</label>


                                                   <asp:CheckBox Enabled="false"  ID="IsFreeEscortDis" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton13" runat="server" Text="Yes" GroupName="IsFreeEscortDis" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton14" runat="server" Text="No" GroupName="IsFreeEscortDis" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStFreeBicycle}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="FreeBicycle" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton15" runat="server" Text="Yes" GroupName="FreeBicycle" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton16" runat="server" Text="No" GroupName="FreeBicycle" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsResidingHostel}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsResidingHostel" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton17" runat="server" Text="Yes" GroupName="IsResidingHostel" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton18" runat="server" Text="No" GroupName="IsResidingHostel" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsRecSpecialTraining}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsRecSpecialTraining" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton19" runat="server" Text="Yes" GroupName="IsRecSpecialTraining" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton20" runat="server" Text="No" GroupName="IsRecSpecialTraining" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIshomeless}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="Ishomeless" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton21" runat="server" Text="Yes" GroupName="Ishomeless" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton22" runat="server" Text="No" GroupName="Ishomeless" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStIsRegVocationalPrg}}</label>
                                                   <asp:CheckBox Enabled="false"  ID="IsRegVocationalPrg" runat="server" Style="display: none;" />
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton23" runat="server" Text="Yes" GroupName="IsRegVocationalPrg" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false"  ID="RadioButton24" runat="server" Text="No" GroupName="IsRegVocationalPrg" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </fieldset>
                                        <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div id="step-5">
                                        <fieldset>
                                            <legend>&nbsp {{resourcesData.lblScStBankInfo}}</legend>
                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblBankName}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtStudentBankName" CssClass="form-control" runat="server" MaxLength="200" placeholder="Bank Name"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtStudentBankName" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStBankAccount}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtBankAccNo" CssClass="form-control" runat="server" MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" placeholder="Bank Account No" onchange="Validate();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtBankAccNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCBankAccount}}</label>
                                                    <%--<label >Weight of Child(kg)</label>--%>
                                                    <asp:TextBox Enabled="false" ID="txtConfirmBankAccNo" CssClass="form-control" runat="server" placeholder="Confirm Bank Account No." MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" onchange="Validate();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtConfirmBankAccNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCBankIFSC}}</label>
                                                    <%--<label >Weight of Child(kg)</label>--%>
                                                    <asp:TextBox Enabled="false" ID="txtBankIFSCCode" CssClass="form-control" runat="server" MaxLength="11" placeholder="Bank IFSC Code" onchange="CheckIFSC();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtBankIFSCCode" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank IFSC Code." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblParentMobileNo}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtUserMoNo" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtUserMoNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Mobile No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <br />
                                        <fieldset>
                                            <legend>&nbsp {{resourcesData.lblSchoolBankInfo}}</legend>
                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScBankAccActive}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtScActive" CssClass="form-control" runat="server" MaxLength="200" placeholder="School Name in Which Account is Active"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtScActive" Display="Dynamic"
                                                            ErrorMessage="Please enter School Name in Which Account is Active." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblBankName}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtScBankName" CssClass="form-control" runat="server" MaxLength="200" placeholder="Bank Name"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtScBankName" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStBankAccount}}</label>
                                                    <asp:TextBox Enabled="false" ID="txtPrincipalBankNo" CssClass="form-control" runat="server" MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" placeholder="Bank Account No" onchange="SchoolBankValidate();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtBankAccNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCBankAccount}}</label>
                                                    <%--<label >Weight of Child(kg)</label>--%>
                                                    <asp:TextBox Enabled="false" ID="txtPrincipalConfirmBankNo" CssClass="form-control" runat="server" placeholder="Confirm Bank Account No." MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" onchange="SchoolBankValidate();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtConfirmBankAccNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStCBankIFSC}}</label>
                                                    <%--<label >Weight of Child(kg)</label>--%>
                                                    <asp:TextBox Enabled="false" ID="txtPrincipalBankIFSC" CssClass="form-control" runat="server" MaxLength="11" placeholder="Bank IFSC Code" onchange="CheckPrincipalIFSC();"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBankIFSCCode" Display="Dynamic"
                                                            ErrorMessage="Please enter Bank IFSC Code." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblPrincipalBankAccActive}} </label>
                                                    <asp:TextBox Enabled="false" ID="txtPrincipalMoNo" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidatePrincipalMobile();" MaxLength="10"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtPrincipalMoNo" Display="Dynamic"
                                                            ErrorMessage="Please enter Principal Mobile No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>





                                    </div>
                                    <div id="step-6">
                                        <div class="row">
                                            <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblAttach}}</legend>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div id="divCheque" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">{{resourcesData.lblCheque}}
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/cheque.jpg" name="ProfileCheque" Style="height: 180px" ID="imgCheque" />
                                                                <input class="camera" id="Chequeupload" name="Chequeupload" type="file" runat="server" />
                                                                <asp:Button ID="btnCheque" type="submit" Text="Upload" runat="server" ></asp:Button>
                                                                <asp:Panel ID="Panel1" Visible="False" runat="server">
                                                                    <asp:Label ID="lblResultCheque" runat="server"></asp:Label>
                                                                </asp:Panel>

                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <div id="divPassbook" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">{{resourcesData.lblPassbook}}
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/Passbook.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgPassbook" />
                                                                <input class="camera" id="Passbookupload" name="Passbookupload" type="file" runat="server" />
                                                                <asp:Button ID="btnPassbook" type="submit" Text="Upload" runat="server" ></asp:Button>
                                                                <asp:Panel ID="Panel2" Visible="False" runat="server">
                                                                    <asp:Label ID="lblResultPassbook" runat="server"></asp:Label>
                                                                </asp:Panel>

                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="clearfix"></div>
                                            <%---Start of Button----%>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>

                    </div>
                    <script>
                        if (document.getElementById("intrnlContent") != null) {
                            angular.bootstrap(document.getElementById("intrnlContent"), ['appmodule']);
                        }
                    </script>
                  <div class="clearfix"></div>
            </div>
        </div>
    </div>
                  
                <br />
                <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                    <input type="button" id="btnHome" class="btn btn-info" style="background-color: #0040FF !important;" value="Home" onclick="javascript: CallHome('divHome');" />
                    
                </div>
         <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    </form>
       
</body>
</html>
