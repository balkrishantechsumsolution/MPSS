<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAcknowledgeCorrespondent.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.ViewAcknowledgeCorrespondent" %>

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
            var url = "/WebApp/G2G/DeptProfile.aspx";
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
           <div class="col-md-12 box-container" runat="server" id="div2">


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
                        <div style="height: 160px; width: 100%; border-bottom: 1px solid #999;">
                            <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                                <tr>
                                    <td>
                                        <div style="width: 165px; margin: 2px 0 0 5px; float: left; height: 115px;">
                                            <img alt="Logo" src="/../../PortalImages/MPLogo.png" style="width: 85px; margin: 11px 0px 0px 33px;" />
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center"> MAHARSHI PATANJALI SANSKRIT SANSTHAN <br />महर्षि पतंजलि संस्कृत संस्थान, भोपाल,
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <div style="width: 165px; float: right; margin: 0px 0 0 5px">
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
                                                <h2>{{resourcesData.lblCorrespond1}}</h2>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12 box-container" runat="server" id="div1">

                                        <div class="box-heading form_hd">
                                            <div class="box-heading form_hd">
                                                <h4>{{resourcesData.lblCorrespond2}}</h4>

                                            </div>
                                        </div>

                                    </div>

                                </div>





                                <div class="box-body box-body-open">



                                    <div id="step-1">
                                <div class="row">
                                    <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond3}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                            <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond4}}</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS1" runat="server" Text="{{resourcesData.lblCorrespond5}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS2" runat="server" Text="{{resourcesData.lblCorrespond6}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS3" runat="server" Text="{{resourcesData.lblCorrespond7}}" GroupName="CRCS" Checked="true" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS4" runat="server" Text="{{resourcesData.lblCorrespond8}}" GroupName="CRCS" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS5" runat="server" Text="{{resourcesData.lblCorrespond9}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                     <asp:RadioButton Enabled="false"  ID="rbCRCS6" runat="server" Text="{{resourcesData.lblCorrespond10}}" GroupName="CRCS" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond11}}</label>
                                                    <asp:TextBox Enabled="false"  ID="txtSocietyName" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Society Name and Address"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSocietyName" Display="Dynamic"
                                                            ErrorMessage="Please Enter Society Name and Address." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond12}}</label>
                                                    <asp:TextBox Enabled="false"  ID="txtSchoolName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSchoolName" Display="Dynamic"
                                                            ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond13}}</label>
                                                    <asp:TextBox Enabled="false"  ID="txtSchoolAddress" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSchoolAddress" Display="Dynamic"
                                                            ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend>&nbsp {{resourcesData.lblCorrespond14}}</legend>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond15}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                        ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond16}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
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
                                                   {{resourcesData.lblCorrespond17}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                        ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                  {{resourcesData.lblCorrespond18}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                                    {{resourcesData.lblCorrespond19}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtDistrict" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond20}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                        ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblCorrespond21}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSchoolMobile" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSchoolMobile" Display="Dynamic"
                                                        ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-2">
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond24}}</legend>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond25}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSoceityRegNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSoceityRegNo" Display="Dynamic"
                                                    ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond26}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSoceityRegDate" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSoceityRegDate" Display="Dynamic"
                                                    ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond27}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSoceityValDate" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSoceityValDate" Display="Dynamic"
                                                    ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond28}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtPANNO" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPANNO" Display="Dynamic"
                                                    ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond29}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSoceityNoOfMember" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSoceityNoOfMember" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory">{{resourcesData.lblCorrespond30}}
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgAttachLstSocM" />
                                                   
                                                    

                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond31}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyDirectorName" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSocietyDirectorName" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                 {{resourcesData.lblCorrespond32}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSocietyCity" Display="Dynamic"
                                                    ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                               {{resourcesData.lblCorrespond33}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyPost" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtSocietyPost" Display="Dynamic"
                                                    ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond34}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtSocietyDistrict" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond36}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtSocietyPinCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                 {{resourcesData.lblCorrespond35}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSocietyMobileNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSocietyMobileNo" Display="Dynamic"
                                                    ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond37}}</label>
                                            <asp:TextBox Enabled="false"  ID="txtSocietyOtherOperated" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Other operate Society School Name and Address"></asp:TextBox>

                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblCorrespond38}}</legend>
                                    <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond39}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbOAreaSchoolOperated1" runat="server" Text="{{resourcesData.lblCorrespond41}}" GroupName="rbOAreaSchoolOperated1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbOAreaSchoolOperate2" runat="server" Text="{{resourcesData.lblCorrespond42}}" GroupName="rbOAreaSchoolOperated1" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond43}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtMunicipalCorp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtMunicipalCorp" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond44}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtDisSchoolHeadQuater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDisSchoolHeadQuater" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond45}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPoliceSt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtNrPoliceSt" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond46}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPoliceStDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtNrPoliceStDistance" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond47}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPoliceStDivision" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtNrPoliceStDivision" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond48}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPolicePhNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtNrPolicePhNo" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond49}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtNrGovtHighSch" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond50}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtNrGovtHighSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond555}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHighSchDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtNrGovtHighSchDistance" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>


                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond51}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtNrGovtHigherSch" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond52}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtNrGovtHigherSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond53}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrGovtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtNrGovtHigherSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond54}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtNrPvtHighSch" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond55}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtNrPvtHighSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond56}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHighSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtNrPvtHighSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond57}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtNrPvtHigherSch" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond58}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtNrPvtHigherSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond59}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNrPvtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtNrPvtHigherSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond60}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbSchoolType1" runat="server" Text="{{resourcesData.lblCorrespond61}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbSchoolType2" runat="server" Text="{{resourcesData.lblCorrespond62}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                             <asp:RadioButton Enabled="false"  ID="rbSchoolType3" runat="server" Text="{{resourcesData.lblCorrespond63}}" GroupName="rbSchoolType1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbSchoolType4" runat="server" Text="{{resourcesData.lblCorrespond64}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond65}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                             <asp:RadioButton Enabled="false"  ID="rbSocietyBrd1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbSocietyBrd1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbSocietyBrd2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbSocietyBrd1" />

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond68}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtBrdUni" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtBrdUni" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond69}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtFromDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtFromDate" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond70}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtRegNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtRegNo" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond71}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtRegDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtRegDate" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond72}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtRunCommitteeSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtRunCommitteeSch" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond73}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSchPraveshika" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtSchPraveshika" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond74}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond75}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetLKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond76}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetUKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond77}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetCls14" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond78}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPrav" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond79}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPrathma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond80}}
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsDuti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond81}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond82}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPoravePth" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond83}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPoraveAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond84}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPoraveUtt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond85}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSankiyadetClsPoraveUttAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </fieldset>

                                <div class="clearfix"></div>

                                <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond86}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">  {{resourcesData.lblCorrespond87}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgAttachTime" />
                                                       
                                                      

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div id="divPassbook" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond88}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgAttachedSubject" />
                                                        
                                                       

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <div id="step-3">
                                <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp  {{resourcesData.lblCorrespond202}}</legend>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond203}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHeadMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtHeadMist" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond204}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHeadMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="txtHeadMistQual" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond205}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPrinMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="txtPrinMist" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond556}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPrinMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtPrinMistQual" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond207}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond208}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond209}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond210}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond211}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond212}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond213}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond214}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtMSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond215}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtMSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond216}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtMSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond217}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtMSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond218}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtMSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond219}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond220}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond221}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond222}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond223}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond224}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtPQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond225}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond226}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHCQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond227}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHCQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond228}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHCQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond229}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHCQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond230}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtHCQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond231}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond232}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond233}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond234}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond235}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond236}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond237}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAQTPTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtAQTPTI" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond238}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAssitTeachSci" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtAssitTeachSci" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond239}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtStudMed" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtStudMed" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond240}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond241}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtFeesPrathama" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond242}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtFeesPurvamadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond243}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtFeesUttarmadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond244}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond245}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtLedger" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond246}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAssistantOff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond247}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtFourthGrade" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-4">
                                <fieldset>
                                    <legend>&nbsp     {{resourcesData.lblCorrespond89}}</legend>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond90}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond91}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond92}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond93}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond94}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond95}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond96}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond97}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtAFTMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond98}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtAFTMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond99}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtAFTMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond100}}
                                            </label>
                                            <asp:TextBox Enabled="false"  ID="txtAFTMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblCorrespond570}}</legend>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond101}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond102}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtKhasra" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond103}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond104}}
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgLandReg" />
                                                   
                                                    

                                                </div>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond105}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtRentAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond106}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtRentOwnerAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond107}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgRentAgreement" />
                                                       
                                                        

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        {{resourcesData.lblCorrespond108}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false"  ID="txtAreaSchLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                          {{resourcesData.lblCorrespond109}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false"  ID="txtAreaSchBuildLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                       {{resourcesData.lblCorrespond110}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false"  ID="txtTotalAreaSchBuild" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        {{resourcesData.lblCorrespond111}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false"  ID="txtTotalAreaSchBuildEmty" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                </fieldset>
                            </div>
                            <div id="step-5">
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblCorrespond112}}</legend>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond113}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFClsStudy" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond114}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtFDArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond115}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtFDSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond116}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsTEACH" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond117}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsTEACHArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond118}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsTEACHSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond119}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsLabLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond120}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsLabLibArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond121}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtNoOFRoomsLabLibSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond122}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtPlayArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond123}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtPlaySqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond124}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtTotalNoToil" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond125}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtTotalNoToilGl" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond126}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtTotalNoToilBY" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond127}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtEqipWater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond128}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond129}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSubLabNum" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond130}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSubLabArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond131}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtSubLabSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory">Attach List of Laboratories Equipments
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgLabEquipments" />
                                                    
                                                   

                                                </div>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond132}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond133}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtNoBooks" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond134}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtAreaLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond135}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSqFTLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond136}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond137}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotFurt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond138}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotFurtGB" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond139}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotChaires" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond140}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotBenches" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond141}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotFurtStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond142}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotChairStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond143}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotAlmariresStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond144}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                 <asp:RadioButton Enabled="false"  ID="rbElectric1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbElectric1" Checked="true" />

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">

                                                 <asp:RadioButton Enabled="false"  ID="rbElectric2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbElectric1" />
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond147}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotComp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond148}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotPrinter" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond149}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotFaxes" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond150}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotOther" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond151}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtTotFireExt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond152}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox Enabled="false"  ID="txtSummittedAmt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond153}}</legend>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond154}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox Enabled="false"  ID="txtPhyHandStudFact" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond155}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                             <asp:RadioButton Enabled="false"  ID="rbPhyHandStudAdPrv1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbPhyHandStudAdPrv1" Checked="true" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                             <asp:RadioButton Enabled="false"  ID="rbPhyHandStudAdPrv2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbPhyHandStudAdPrv1" />
                                        </div>
                                    </div>



                                </fieldset>
                                <div class="clearfix"></div>
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond159}}</legend>
                                    {{resourcesData.lblCorrespond160}}<br />
                                    {{resourcesData.lblCorrespond161}}<br />
                                    sign<br />
                                    <br />
                                    <br />
                                    <br />
                                     {{resourcesData.lblCorrespond162}}
                                    <br />
                                    <br />
                                    {{resourcesData.lblCorrespond163}}<br />
                                    <br />
                                    <br />
                                    <br />

                                     {{resourcesData.lblCorrespond164}}<br />
                                    <br />

                                     {{resourcesData.lblCorrespond165}}<br />
                                    <br />

                                     {{resourcesData.lblCorrespond166}}<br />
                                    <br />
                                     {{resourcesData.lblCorrespond167}}<br />
                                    <br />
                                    {{resourcesData.lblCorrespond168}}<br />
                                    <br />
                                    <br />
                                    <br />

                                     {{resourcesData.lblCorrespond169}}<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                   {{resourcesData.lblCorrespond170}}<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                      {{resourcesData.lblCorrespond171}}
                                </fieldset>

                                <%---Start of Button----%>
                            </div>


                                    <div id="step-6">
                                        <div class="row">
                                            <fieldset id="divAppendix1" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp  {{resourcesData.lblCorrespond249}}</legend>



                                                <div style="text-align: center;">{{resourcesData.lblCorrespond248}}</div>

                                                <br />
                                                <br />

                                                {{resourcesData.lblCorrespond250}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond251}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond252}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond253}}                                                                                                                       
                                                                                                                                             

                                          <br />
                                                <br />
                                                {{resourcesData.lblCorrespond254}}
                                           
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond255}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond256}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond257}}
                                                                                      <br />
                                                <br />


                                                {{resourcesData.lblCorrespond258}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond259}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond260}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond261}}
                                            <br />
                                                <br />

                                                {{resourcesData.lblCorrespond262}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond263}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond264}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond265}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond266}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond267}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond268}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond269}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond270}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond271}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond272}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond273}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond274}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond275}}
                                            <br />
                                                <br />
                                            </fieldset>

                                        </div>
                                    </div>
                                    <div id="step-7">
                                        <div class="row">
                                            <fieldset id="divAppendix2" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblCorrespond566}}</legend>

                                                <div style="text-align: center;">{{resourcesData.lblCorrespond276}}</div>
                                                <br />
                                                <br />
                                                <div style="text-align: center;">{{resourcesData.lblCorrespond277}}</div>
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond278}}
 
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond279}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond280}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond281}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond282}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond283}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond284}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond285}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond286}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond287}}<br />
                                                <br />
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond288}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond289}}<br />
                                                <br />
                                                <div style="align-items: center">{{resourcesData.lblCorrespond290}}</div>
                                                <br />
                                                <br />

                                                {{resourcesData.lblCorrespond291}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond292}}
                                             <br />
                                                <br />
                                                {{resourcesData.lblCorrespond293}}
                                            <br />
                                                <br />
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div id="step-8">
                                        <div class="row">
                                            <fieldset id="divAppendix3" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblCorrespond294}}</legend>

                                                <div style="text-align: center;">{{resourcesData.lblCorrespond294}}</div>
                                                <br />
                                                <br />
                                                <div style="text-align: center;">{{resourcesData.lblCorrespond295}}</div>
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond296}} -<br />
                                                <br />
                                                {{resourcesData.lblCorrespond297}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond298}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond299}}
 Submission will be mandatory.<br />
                                                <br />
                                                {{resourcesData.lblCorrespond300}}<br />
                                                <br />
                                                <br />
                                                <br />


                                                {{resourcesData.lblCorrespond301}}<br />
                                                <br />

                                                {{resourcesData.lblCorrespond302}}<br />
                                                <br />
                                                <br />
                                                <br />
                                                <div style="text-align: center; align-items: center; display: flex; justify-content: center;">
                                                    <table style="border: 1px solid black; border-collapse: collapse;">
                                                        <thead style="border: 1px solid black; border-collapse: collapse;">
                                                            <th style="border: 1px solid black; border-collapse: collapse;">Serial No</th>
                                                            <th style="border: 1px solid black; border-collapse: collapse;">Class level for the year</th>
                                                            <th style="border: 1px solid black; border-collapse: collapse;">Fixed fee amount for New affiliation(for one year)</th>
                                                        </thead>
                                                        <tr>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">1</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">L.K.G.  (Arun) to class 04 </td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">1,000/-</td>
                                                        </tr>
                                                        <tr style="border: 1px solid black; border-collapse: collapse;">
                                                            <td style="border: 1px solid black; border-collapse: collapse;">2</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">L.K.G.  (Arun) to Praveshika</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">3,000/-</td>
                                                        </tr>
                                                        <tr style="border: 1px solid black; border-collapse: collapse;">
                                                            <td style="border: 1px solid black; border-collapse: collapse;">3</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">L.K.G.  (Arun) to Prathma</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">2,000/-</td>
                                                        </tr>
                                                        <tr style="border: 1px solid black; border-collapse: collapse;">
                                                            <td style="border: 1px solid black; border-collapse: collapse;">4</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">L.K.G.  (Arun)  again one</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">11,000/-</td>
                                                        </tr>
                                                        <tr style="border: 1px solid black; border-collapse: collapse;">
                                                            <td style="border: 1px solid black; border-collapse: collapse;">5</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">(From L.K.G. (Assam) to his</td>
                                                            <td style="border: 1px solid black; border-collapse: collapse;">13,000/-</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond310}}
                                        <br />
                                                <br />
                                                {{resourcesData.lblCorrespond311}}
                                        <br />
                                                <br />
                                                {{resourcesData.lblCorrespond312}}
                                        <br />
                                                <br />
                                                {{resourcesData.lblCorrespond313}}
 Enter the PIN code of
                                        <br />
                                                <br />
                                                {{resourcesData.lblCorrespond314}}
                                        <br />
                                                <br />
                                                {{resourcesData.lblCorrespond315}}
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div id="step-9">
                                        <div class="row">
                                            <fieldset id="divAppendix4" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp  {{resourcesData.lblCorrespond316}}</legend>
                                                <div style="text-align: center;">{{resourcesData.lblCorrespond317}}</div>
                                                <br />
                                                <br />
                                                <div style="text-align: center;">
                                                    {{resourcesData.lblCorrespond318}}
 and criteria
                                                </div>
                                                <br />
                                                <br />
                                                <div style="text-align: center;">{{resourcesData.lblCorrespond319}}</div>
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond320}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond321}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond322}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond323}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond324}}
                                      <br />
                                                <br />
                                                {{resourcesData.lblCorrespond325}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond326}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond327}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond328}}
 By Panchayat.<br />
                                                <br />
                                                {{resourcesData.lblCorrespond329}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond330}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond331}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond332}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond333}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond334}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond335}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond336}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond337}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond338}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond339}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond340}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond341}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond342}}<br />
                                                <br />
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond343}}

                                            </fieldset>
                                        </div>
                                    </div>
                                    <div id="step-10">
                                        <div class="row">
                                            <fieldset id="divAppendix5" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblCorrespond344}}</legend>
                                                <div style="text-align: center;">{{resourcesData.lblCorrespond344}}</div>
                                                <br />
                                                <br />
                                                <div style="text-align: center;">
                                                    {{resourcesData.lblCorrespond345}}<br />
                                                    <br />
                                                    {{resourcesData.lblCorrespond346}}<br />
                                                    <br />
                                                    {{resourcesData.lblCorrespond347}}
                                                </div>
                                                <br />
                                                <br />
                                                {{resourcesData.lblCorrespond348}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond349}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond350}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond351}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond352}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond353}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond354}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond355}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond356}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond357}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond358}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond359}}
                                            <br />
                                                <br />
                                                {{resourcesData.lblCorrespond360}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond361}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond362}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond363}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond364}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond365}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond366}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond367}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond368}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond369}}-<br />
                                                <br />
                                                {{resourcesData.lblCorrespond370}}
                                        <br />
                                                {{resourcesData.lblCorrespond371}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond372}}
                                        <br />
                                                {{resourcesData.lblCorrespond373}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond374}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond375}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond376}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond377}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond378}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond379}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond380}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond381}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond382}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond383}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond384}}
 be marked<br />
                                                <br />
                                                {{resourcesData.lblCorrespond385}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond386}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond387}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond388}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond389}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond390}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond391}}<br />
                                                <br />

                                                {{resourcesData.lblCorrespond392}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond393}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond394}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond395}}<br />
                                                <br />
                                                {{resourcesData.lblCorrespond396}}<br />
                                                <br />

                                            </fieldset>

                                          
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
          <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
         <script>
             if (document.getElementById("intrnlContent") != null) {
                 angular.bootstrap(document.getElementById("intrnlContent"), ['appmodule']);
             }
         </script>
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
            <input type="button" id="btnHome" class="btn btn-info" style="background-color: #0040FF !important;" value="Home" onclick="javascript: CallHome('divHome');" />
        </div>
    </form>
</body>
</html>
