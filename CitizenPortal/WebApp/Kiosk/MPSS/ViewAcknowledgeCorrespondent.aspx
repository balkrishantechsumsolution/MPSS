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
                                                <h2>Correspondent Renewal Application Form Year 2023-24</h2>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12 box-container" runat="server" id="div1">

                                        <div class="box-heading form_hd">
                                            <div class="box-heading form_hd">
                                                <h4>Sanskrit School for LKG / UKG / Class 1-4
                                    / Praveshika / Purmadhima / Uttarmadhima class to be operated</h4>

                                            </div>
                                        </div>

                                    </div>

                                </div>





                                <div class="box-body box-body-open">



                                    <div id="step-1">
                                        <div class="row">
                                            <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp School Detail</legend>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                                    <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                                        <div class="form-group">
                                                            <label class="manadatory">Correspondent Renewal Class</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false" ID="rbCRCS1" runat="server" Text="LKG" GroupName="CRCS" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false" ID="rbCRCS2" runat="server" Text="UKG" GroupName="CRCS" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">

                                                            <asp:RadioButton Enabled="false" ID="rbCRCS3" runat="server" Text="Class 1-4" GroupName="CRCS" Checked="true" />
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false" ID="rbCRCS4" runat="server" Text="Praveshika" GroupName="CRCS" />

                                                        </div>
                                                    </div>



                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:RadioButton Enabled="false" ID="rbCRCS5" runat="server" Text="Purmadhima" GroupName="CRCS" />

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">

                                                            <asp:RadioButton Enabled="false" ID="rbCRCS6" runat="server" Text="Uttarmadhima" GroupName="CRCS" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label class="manadatory">Society Name and Address</label>
                                                            <asp:TextBox Enabled="false" ID="txtSocietyName" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Society Name and Address"></asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSocietyName" Display="Dynamic"
                                                                    ErrorMessage="Please Enter Society Name and Address." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label class="manadatory">School Name</label>
                                                            <asp:TextBox Enabled="false" ID="txtSchoolName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSchoolName" Display="Dynamic"
                                                                    ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label class="manadatory">School Address</label>
                                                            <asp:TextBox Enabled="false" ID="txtSchoolAddress" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                            <div class="col-xs-12 pleft0 p5">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSchoolAddress" Display="Dynamic"
                                                                    ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </fieldset>
                                            <fieldset>
                                                <legend>&nbsp School Address Details</legend>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlFullName">
                                                            House No
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
                                                            Colony
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
                                                            City
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
                                                            Block
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
                                                            District
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
                                                            PinCode
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

                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlFullName">
                                                            Mobile No
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSchoolMobile" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
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
                                            <legend>&nbsp Soceity Details</legend>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        Soceity Registration No
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSoceityRegNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSoceityRegNo" Display="Dynamic"
                                                            ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        Registration Date
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSoceityRegDate" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
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
                                                        Validity Date
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSoceityValDate" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSoceityValDate" Display="Dynamic"
                                                            ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        PAN No(Income Tax No)
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtPANNO" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                                        No of Member in Soceity
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSoceityNoOfMember" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSoceityNoOfMember" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div id="divCheque" class="col-md-12 box-container">
                                                    <div class="box-heading">
                                                        <h4 class="box-title manadatory">Attach List of Society Members Registration Application form.
                                      
                                                        </h4>
                                                    </div>
                                                    <div class="box-body box-body-open p0">
                                                        <div class="col-lg-12">
                                                            <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="Image1" />
                                                            <input class="camera" id="fileSocietyMembersReg" name="Chequeupload" type="file" runat="server" />
                                                            <asp:Button ID="Button1" type="submit" Text="Upload" runat="server"></asp:Button>
                                                            <asp:Panel ID="Panel3" Visible="False" runat="server">
                                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                                            </asp:Panel>

                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Soceity Director Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyDirectorName" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSocietyDirectorName" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        City/Village
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSocietyCity" Display="Dynamic"
                                                            ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        Post
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyPost" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                                        District
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtSocietyDistrict" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        PinCode
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtSocietyPinCode" Display="Dynamic"
                                                            ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlFullName">
                                                        Mobile No
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSocietyMobileNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSocietyMobileNo" Display="Dynamic"
                                                            ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">Other Operated Society School Name and Address</label>
                                                    <asp:TextBox Enabled="false" ID="txtSocietyOtherOperated" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Other operate Society School Name and Address"></asp:TextBox>

                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>&nbsp Other Details</legend>
                                            <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                                <div class="form-group">
                                                    <label class="manadatory">In which area school operated</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbOAreaSchoolOperated1" runat="server" Text="Rural" GroupName="rbOAreaSchoolOperated1" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbOAreaSchoolOperate2" runat="server" Text="Urban" GroupName="rbOAreaSchoolOperated1" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Municipal Corporation Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtMunicipalCorp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Distance of School from District Headquater
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtDisSchoolHeadQuater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDisSchoolHeadQuater" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Police Station Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPoliceSt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Police Station Distance from School
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPoliceStDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtNrPoliceStDistance" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Police Station Administrative Division from School
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPoliceStDivision" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Police Station Phone No from School
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPolicePhNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Govt High School Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtNrGovtHighSch" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Govt High School Name Address
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Govt High School Name Distance
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHighSchDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Govt Higher School Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtNrGovtHigherSch" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Govt Higher School Name Address
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Govt Higher School Name Distance
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrGovtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Private High School Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtNrPvtHighSch" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Private High School Name Address
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Private High School Name Distance
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHighSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Private Higher School Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtNrPvtHigherSch" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Nearest Private Higher School Name Address
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Nearest Private Higher School Name Distance
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNrPvtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtNrPvtHigherSchDist" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                                <div class="form-group">
                                                    <label class="manadatory">School Type</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbSchoolType1" runat="server" Text="Co-ED" GroupName="rbSchoolType1" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbSchoolType2" runat="server" Text="Boys" GroupName="rbSchoolType1" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton Enabled="false" ID="rbSchoolType3" runat="server" Text="Girls" GroupName="rbSchoolType1" Checked="true" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbSchoolType4" runat="server" Text="Hostel" GroupName="rbSchoolType1" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Is Society related to another board
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton Enabled="false" ID="rbSocietyBrd1" runat="server" Text="Yes" GroupName="rbSocietyBrd1" Checked="true" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbSocietyBrd2" runat="server" Text="No" GroupName="rbSocietyBrd1" />

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Board or university Name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtBrdUni" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtBrdUni" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        from date
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtFromDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Registration No
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtRegNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtRegNo" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Registration date
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtRegDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        By which committee is the School/College being run, is the school being run by any other Board/University or by the same name
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtRunCommitteeSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtRunCommitteeSch" Display="Dynamic"
                                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Does the school conduct Praveshika and Pratham classes, please give details
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSchPraveshika" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                        Sankiya details of SAROOP AVASI / GARVASI Hostel Boys and Girls of Sanskrit School par class
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        LKG
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetLKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        UKG
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetUKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Class 1-4
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetCls14" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Pravashika
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPrav" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Prathama Prathakhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPrathma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Dutikhand
                                                    </label>


                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsDuti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Antimkhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Porve Pratakhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPoravePth" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Porave  Antimkhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPoraveAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Uttar Prathakhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPoraveUtt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Uttar  Antimkhand
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSankiyadetClsPoraveUttAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                        </fieldset>

                                        <div class="clearfix"></div>

                                        <div class="row">
                                            <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                                <legend>&nbsp {{resourcesData.lblAttach}}</legend>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div id="divCheque" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">Attach Timetables of Classes
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgattchtime" />
                                                                <input class="camera" id="fileAttTime" name="Chequeupload" type="file" runat="server" />
                                                                <asp:Button ID="btnTimetables" type="submit" Text="Upload" runat="server"></asp:Button>
                                                                <asp:Panel ID="Panel1" Visible="False" runat="server">
                                                                    <asp:Label ID="lblResultCheque" runat="server"></asp:Label>
                                                                </asp:Panel>

                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <div id="divPassbook" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">Attached Subject Wise Teachers Sheet
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgattchsub" />
                                                                <input class="camera" id="fileTeachSht" name="Passbookupload" type="file" runat="server" />
                                                                <asp:Button ID="btnSubject" type="submit" Text="Upload" runat="server"></asp:Button>
                                                                <asp:Panel ID="Panel2" Visible="False" runat="server">
                                                                    <asp:Label ID="lblResultPassbook" runat="server"></asp:Label>
                                                                </asp:Panel>

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
                                                <legend>&nbsp  Academic  Arrangement Description</legend>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Head Mistress
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHeadMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        <div class="col-xs-12 pleft0">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtHeadMist" Display="Dynamic"
                                                                ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Head Mistress Qualification
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHeadMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                            Principal Mistress
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPrinMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        <div class="col-xs-12 pleft0">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="txtPrinMist" Display="Dynamic"
                                                                ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Principal Qualification
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPrinMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                            Total number of Sanskrit qualified teachers
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            M.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            B.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            SHIKSHA SHASTRI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            D.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            BTI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total number of Modern Subjects qualified teachers
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            M.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtMSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            B.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtMSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            SHIKSHA SHASTRI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtMSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            D.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtMSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            BTI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtMSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total number of Professors qualified teachers
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            M.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            B.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            SHIKSHA SHASTRI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            D.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            BTI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtPQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>

                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total number of High Class qualified teachers
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            M.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHCQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            B.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHCQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            SHIKSHA SHASTRI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHCQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            D.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHCQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            BTI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtHCQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total number of Assistant qualified teachers
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            M.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            B.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            SHIKSHA SHASTRI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            D.Ed
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            BTI
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            P.T.I
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAQTPTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        <div class="col-xs-12 pleft0">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtAQTPTI" Display="Dynamic"
                                                                ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Assitant Teacher Science
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAssitTeachSci" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                            Studies Medium
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtStudMed" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                            Details of Fees given by Students
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Prathama
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtFeesPrathama" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Purvamadiyama
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtFeesPurvamadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Uttarmadiyma
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtFeesUttarmadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Working Employees Details 
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Ledger
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtLedger" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Assistant officer
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAssistantOff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Fourth Grade
                                                        </label>


                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtFourthGrade" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div id="step-4">
                                        <fieldset>
                                            <legend>&nbsp Time Table  Details</legend>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Information about Classes wise Time Table
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Morning First Shift Information
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        From Time
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <label class="manadatory" for="ddlDistrict">
                                                        From Class
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        To Time
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <label class="manadatory" for="ddlDistrict">
                                                        To Class
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        After noon First Shift Information
                                                    </label>


                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        From Time
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtAFTMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <label class="manadatory" for="ddlDistrict">
                                                        From Class
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtAFTMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        To Time
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtAFTMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    <label class="manadatory" for="ddlDistrict">
                                                        To Class
                                                    </label>
                                                    <asp:TextBox Enabled="false" ID="txtAFTMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>&nbsp School Land/Building  Details</legend>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Information about School Land
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Khasra no
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtKhasra" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div id="divCheque" class="col-md-12 box-container">
                                                    <div class="box-heading">
                                                        <h4 class="box-title manadatory">Attach Copy of land Registration(Khasra/B1-Map)
                                      
                                                        </h4>
                                                    </div>
                                                    <div class="box-body box-body-open p0">
                                                        <div class="col-lg-12">
                                                            <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="Image2" />
                                                            <input class="camera" id="fileKhasra" name="Chequeupload" type="file" runat="server" />
                                                            <asp:Button ID="Button2" type="submit" Text="Upload" runat="server"></asp:Button>
                                                            <asp:Panel ID="Panel4" Visible="False" runat="server">
                                                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                                            </asp:Panel>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            If land rented than owner Name and Address
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtRentAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            If Building rented than owner Name and Address
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtRentOwnerAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div id="divCheque" class="col-md-12 box-container">
                                                        <div class="box-heading">
                                                            <h4 class="box-title manadatory">If rented than Copy of Rent Agreement
                                      
                                                            </h4>
                                                        </div>
                                                        <div class="box-body box-body-open p0">
                                                            <div class="col-lg-12">
                                                                <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="Image3" />
                                                                <input class="camera" id="fileRentAgree" name="Chequeupload" type="file" runat="server" />
                                                                <asp:Button ID="Button3" type="submit" Text="Upload" runat="server"></asp:Button>
                                                                <asp:Panel ID="Panel5" Visible="False" runat="server">
                                                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                                                </asp:Panel>

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="ddlDistrict">
                                                                Total area of School land(sq.ft.,Hectare)  
                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <asp:TextBox Enabled="false" ID="txtAreaSchLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="ddlDistrict">
                                                                Total area of land to build School(sq.ft.,Hectare) 
                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <asp:TextBox Enabled="false" ID="txtAreaSchBuildLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="ddlDistrict">
                                                                Total build Area
                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:TextBox Enabled="false" ID="txtTotalAreaSchBuild" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="ddlDistrict">
                                                                Total Attach land from building empty space
                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                        <div class="form-group">
                                                            <asp:TextBox Enabled="false" ID="txtTotalAreaSchBuildEmty" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                        </fieldset>
                                    </div>
                                    <div id="step-5">
                                        <fieldset>
                                            <legend>&nbsp Facilities  Details</legend>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        No of Classes for studies
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFClsStudy" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtFDArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Square Feet
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtFDSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        No of rooms for Teachers/Principal
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsTEACH" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsTEACHArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Square Feet
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsTEACHSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        No of rooms for Library and laboratory Classes
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsLabLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsLabLibArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Square Feet
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtNoOFRoomsLabLibSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area of PlayGround 
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtPlayArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Square Feet of PlayGround 
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtPlaySqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Total No of Toilets
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtTotalNoToil" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Girls Toilets
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtTotalNoToilGl" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Boys Toilets
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtTotalNoToilBY" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Equipment of Pure Water
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtEqipWater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Information about laboratory
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Subject wise laboratories number 
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSubLabNum" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Area of  Subject wise laboratories 
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSubLabArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Square Feet of Subject wise laboratories 
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtSubLabSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                            <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="Image4" />
                                                            <input class="camera" id="fileLabEqip" name="Chequeupload" type="file" runat="server" />
                                                            <asp:Button ID="Button4" type="submit" Text="Upload" runat="server"></asp:Button>
                                                            <asp:Panel ID="Panel6" Visible="False" runat="server">
                                                                <asp:Label ID="Label4" runat="server"></asp:Label>
                                                            </asp:Panel>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Information about Libraries
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Number of Books
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtNoBooks" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Area of  Libraries
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtAreaLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Square Feet of Libraries 
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSqFTLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Information about furnitures
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of furnitures
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotFurt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of furnitures for Girls/Boys
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotFurtGB" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of Chaires
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotChaires" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of Benches
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotBenches" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of furnitures for Staff 
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotFurtStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of Chaires for staff
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotChairStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total Number of Almarires for staff
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotAlmariresStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Electricity Provided
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:RadioButton Enabled="false" ID="rbElectric1" runat="server" Text="Yes" GroupName="rbElectric1" Checked="true" />

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">

                                                        <asp:RadioButton Enabled="false" ID="rbElectric2" runat="server" Text="No" GroupName="rbElectric1" />
                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>

                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total no of Computers
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotComp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total no of printers
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotPrinter" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total no of faxes
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotFaxes" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total no of others
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotOther" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>

                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Total no of Fire Extinguishers 
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtTotFireExt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>

                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlDistrict">
                                                            Summitted Amount of Correspondent Renewal
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                    <div class="form-group">
                                                        <asp:TextBox Enabled="false" ID="txtSummittedAmt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                        </fieldset>
                                        <fieldset>
                                            <legend>&nbsp Phisycial handicapped Details</legend>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Phisycial handicapped Students faciities
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox Enabled="false" ID="txtPhyHandStudFact" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        Phisycial handicapped Students Admission Provided
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton Enabled="false" ID="rbPhyHandStudAdPrv1" runat="server" Text="Yes" GroupName="rbPhyHandStudAdPrv1" Checked="true" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton Enabled="false" ID="rbPhyHandStudAdPrv2" runat="server" Text="No" GroupName="rbPhyHandStudAdPrv1" />
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>

                                        </fieldset>
                                        <div class="clearfix"></div>
                                        <fieldset>
                                            <legend>&nbsp Note & Signature</legend>
                                            01. Incomplete application form will be rejected.<br />
                                            02. Affiliation will not be provided if any information is found to be untrue and the offer received will also be terminated.
                                        Will be given.<br />
                                            sign<br />
                                            <br />
                                            <br />
                                            <br />
                                            Secretary / President
                                    <br />
                                            <br />
                                            sign<br />
                                            <br />
                                            <br />
                                            <br />

                                            PrincipalName and term of the committee<br />
                                            <br />

                                            School Name and Padmudra<br />
                                            <br />

                                            Date<br />
                                            <br />
                                            Name<br />
                                            <br />
                                            Full Address.<br />
                                            <br />
                                            <br />
                                            <br />

                                            Opinion of District Education Officer:-<br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />

                                            Signature (with post seal)<br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            District Education Officer
                                        </fieldset>
                                        <%---Start of Button----%>
                                    </div>
                                </div>

                                <div id="step-6">
                                    <div class="row">
                                          <fieldset id="divAppendix1" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp Appendix 1</legend>



                                            <div style="text-align: center;">New affiliation of Maharishi Patanjali Sanskrit Sansthan Bhopal attached for the year 2022-23 Details of records to be sent</div>
                                          
                                           <br />
                                            <br />

                                            1. Adjournment motion of the committee.                                                            yes / no 
                                            <br />
                                            <br />

                                            2. Registration of Society Copy of Certificate issued by Registrar and Firm Society
                                                                                                                                        yes / no 
                                            <br />
                                            <br />

                                            3.Certified Manual of the Society (Issued by Registrar and Firm Society)                           
                                                                                                                                           yes no 
                                            <br />
                                            <br />

                                            4.  Attested photocopy of the list of members of the managing committee (Section 27) which Be of study status.                                                                                                                         yes / no
                                                                                                                                             

                                          <br />
                                            <br />
 5.Along with the qualification and date of appointment of teachers working for teaching, along with the following information (Sanskrit qualified,
 including Shastri/Acharya) as mentioned in the application
 Separately for each class and each subject in the applied Sanskrit school, teachers with desired educational qualification
 It is mandatory to have  The desired educational qualification implies that L.K.G.  Related to (Arun) for Praveshika
 Regarding H.S.  / Uttar Madhyamik and D. Ed.  / b.  T.I / B.T.C.  And in the subject related to the first to the middle
 Shastri and B.Ed.  / Education Shastri and Acharya / M.A.  (Sanskrit) and B.  Ed / Education
 Shastri is mandatory to be a qualified teacher.
                                                                                                                                  yes / no 
                                           
                                            <br />
                                            <br />

                                            6.Registered photocopy of land/building ownership and photo of the entire building 
                                          
                                            yes / no 
                                            <br />
                                            <br />

                                            7.Khasra copy map of ownership of land / building, urban body, village Certified by Panchayat 
                                           
                                            yes / no 
                                           
                                            <br />
                                            <br />
                                            8.  If the present school building is on rent, then registered or notarized copy of rent deed
 yes / no 
                                                                                      <br />
                                            <br />
                                          
                                                                      
 9.  Attested photocopy of the map of the present school building Municipal Corporation, Municipality
 Or by Gram Panchayat.
 yes / no 
                                            <br />
                                            <br />
   10.                                         Inspection report with opinion of District Education Officer
                                                                                    
 
 yes / no 
                                            <br />
                                            <br />
                                          11.  Certified copy of the departmental permission payable by the District Education Officer

 
 yes / no 
                                            <br />
                                            <br />
                                            12.
 Certified copy of equipment and materials available in the laboratory
 yes / no 
                                            <br />
                                            <br />
                                            13.
 Attested photocopy of the last audit report (of the society)
 yes / no 
                                            <br />
                                            <br />
                                            14.
 Certified records regarding the information about the playground of the school
 yes / no 
                                            <br />
                                            <br />
                                          15.   expected class wise student strength

 yes / no 
                                            <br />
                                            <br />
                                            16.
 Possible Class wise Time Division Cycle yes/no 
                                            <br />
                                            <br />
                                            17.
 Expected teacher wise time department cycle 
                                            <br />
                                            <br />
                                            18.
 Institution's own certificate regarding desired facilities to the disabled
 L.K.G.  (Arun) UK  Yes.  (Uday) and on the ground floor for the students of classes 1 to 4
 yes no 
                                            <br />
                                            <br />
                                            19.
 There should be arrangement.
 The building of the school should not be more than ground floor, first floor, second floor (three floors)
 yes / no 
                                            <br />
                                            <br />
                                            20.
 Required (self certification). 
                                            <br />
                                            <br />
                                            21.
 Two color photographs of the postcard size of the building are attached.
 yes no 
                                            <br />
                                            <br />
                                            Note :- 
                                            <br />
                                            <br />
                                            yes / no 
                                            <br />
                                            <br />
                                            01. Whatever photocopies of the above records are attached, get them certified by self attestation. 
                                            <br />
                                            <br />
                                            Institution Principal / Director 
                                            <br />
                                            <br />
                                            signature and stamp 
                                            <br />
                                            <br />
                                        </fieldset>

                                    </div>
                                </div>
                                <div id="step-7">
                                    <div class="row">
                                        <fieldset id="divAppendix2" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp Appendix 2</legend>

                                            <div style="text-align: center;">Appendix 2 7 A-3</div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">"Affidavit"</div>
                                            <br />
                                            <br />
                                            I_ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _ father's name_ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _
 age _ _  _ _  _ _  _ _  _ _ _
 Principal / Institution Head Secretary / Reserve_ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _
 resident_ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _
                                            <br />
                                            <br />
                                            Association Committee solemnly affirm that-<br />
                                            <br />
                                            1. That all the entries and records mentioned in the application form given for affiliation should be kept in the original of the institution.
 Certified as per documents.  All these forms are correct and legal.<br />
                                            <br />
                                            2. That no material fact/entries have been suppressed in the application if any information/record or
 I will be personally responsible if the entries are found to be incorrect.<br />
                                            <br />
                                            3. Chairman/Secretary and members of the Management Committee of the society and all working principals/principals and teachers in the institution
 And the employees have no criminal background in the past and at present also there is no criminal case against them.
 Case is not pending.<br />
                                            <br />
                                            4. I have read all the terms and conditions regarding affiliation of Maharishi Patanjali Sanskrit Sansthan and
 Accepts all the conditions.<br />
                                            <br />
                                            5. The information given in the application form and affidavit is completely true, if any information is found false then
 The institute will have the right to cancel the affiliation application of the school and terminate the affiliation received.
                                            <br />
                                            <br />
                                            6. Students will be made to study only in the course prescribed by Maharishi Patanjali Sanskrit Sansthan.  Syllabus
 In the event of not conducting the study, the affiliation of the institution will be deemed cancelled.
                                            <br />
                                            <br />
                                            7. In case of any legal dispute, the jurisdiction will be Bhopal.
                                            <br />
                                            <br />
                                            8. The institution fulfills the criteria prescribed for classes from Arun to Uttar Madhyamik last section as mentioned in Appendix-5.
         Is.<br />
                                            <br />
                                            <br />
                                            <br />
                                            swearer<br />
                                            <br />
                                            Name<br />
                                            <br />
                                            President / Secretary<br />
                                            <br />
                                            <div style="align-items: center">"Verification"</div>
                                            <br />
                                            <br />

                                           I _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _ self _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _   resident _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _
 Self_ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _  _ _  _ _  _ _  _ _  _ _ _ _ _ _  _
 Verified that in this affidavit, para no.  The information from 01 to 05 is correct and true.<br />
                                            <br />
                                            Location
                                             <br />
                                            <br />
 swearer
                                            <br />
                                            <br />
                                        </fieldset>
                                    </div>
                                </div>
                                <div id="step-8">
                                    <div class="row">
                                        <fieldset id="divAppendix3" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp Appendix 3</legend>

                                            <div style="text-align: center;">Appendix-3</div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">73-4</div>
                                            <br />
                                            <br />
                                            Important instructions for new affiliation 2023-24 from Maharishi Patanjali Sanskrit Sansthan Bhopal -<br />
                                            <br />
                                            1. Application for new affiliation M.P.  Last date for filling online 15 November 2022<br />
                                            <br />
                                            2. After filling the application, a hardcopy (in duplicate with complete records) will be sent to the District Education Officer
 Date of submission in office 15 December 2022<br />
                                            <br />
                                            3. Application form (with complete records) in Maharishi Patanjali Sanskrit Sansthan, due date 30 December 20022
 Submission will be mandatory.<br />
                                            <br />
                                            4. On the basis of prescribed criteria of the applications submitted by the concerned school to the District Education Office
 For inspection, the inspection team of the school has been constituted by the District Education Officer and the departmental
 By making sure to edit the report through MP online by the permission date 15 January 2023
 Make sure to submit the office by 10 February 2023 15 Fees-<br />
                                            <br />
                                            <br />
                                            <br />
                                            5. Fee  details<br />
                                            <br />
                                            Fixed fee amount for new affiliation<br />
                                            <br />
                                           <br />
                                            <br />
                                            <div style="text-align:center;align-items:center;display: flex;justify-content: center;">
                                            <table style="border:1px solid black;border-collapse:collapse;">
                                                <thead style="border:1px solid black;border-collapse:collapse;">
                                                     <th style="border:1px solid black;border-collapse:collapse;">Serial No</th>
                                                     <th style="border:1px solid black;border-collapse:collapse;">Class level for the year</th>
                                                     <th style="border:1px solid black;border-collapse:collapse;">Fixed fee amount for New affiliation(for one year)</th>
                                                </thead>
                                                <tr>
                                                    <td style="border:1px solid black;border-collapse:collapse;">1</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun) to class 04 </td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> 1,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">2</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">L.K.G.  (Arun) to Praveshika</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">3,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">3</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun) to Prathma</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">2,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">4</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun)  again one</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">11,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">5</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">(From L.K.G. (Assam) to his</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">13,000/-</td>
                                                </tr>
                                            </table>
                                           </div>
 
                                            <br />
                                            <br />
                                            6. Only for all levels for non-government oriental / traditional residential Sanskrit school (with hostel) seeking new affiliation
 Application Form Fee Rs.  500/- is fixed.  Such schools are oriental / traditional residential Sanskrit schools (with hostel) category
 apply for new affiliation in M.P.  While applying online only application fee of Rs.  500/- to be paid
 Will happen.  On the basis of which, after getting the departmental permission/recommendation of the District Education Officer, the site test will be conducted by the institute and
 The school will be recognized as a traditional residential Sanskrit school (with hostel).  Oriental / in the inspection conducted by the institute
 In case of invalidation in the category of traditional residential Sanskrit school (with hostel), the concerned school will be treated as a normal non-government school.
 Will be kept in category.  On the basis of which the fee amount prescribed for new affiliation to general non-government schools on paragraph 8 to the concerned school
 DD  to be submitted to the Institute Office.  On the basis of which the students of these schools will be eligible to appear in the examination.
                                        <br />
                                            <br />
                                            7.
 Only the application form fee is fixed for government Sanskrit schools, the rest will be free from the fee.
                                            <br />
                                            <br />
                                            8.
 As per clause 2, application can be made with late fee up to 30 days.  The late fee will be double the amount as per clause 8.
                                            <br />
                                            <br />
                                            9.
 MP.  Where the school is being conducted, or to be conducted while applying online.  Full address of that Village / Town / Place Post Office
 Enter the PIN code of
                                            <br />
                                            <br />
                                            10.
 ,  After applying from M. P. Online, if the hard copy along with supporting papers is sent to Maharishi Patanjali Sanskrit Sansthan, Sanskrit Bhavan by the stipulated time.
 Tulsi Nagar, Second Stop, Bhopal, Madhya Pradesh, -462003, then the affiliation will not be considered, the institution itself will be responsible for this.
                                            <br />
                                            <br />
                                            11. Affiliation will not be granted if the above mentioned information/certificates etc. are not attached and it appears suspicious.
 The affiliation granted will be terminated without any prior notice.
                                        </fieldset>
                                    </div>
                                </div>
                                <div id="step-9">
                                    <div class="row">
                                        <fieldset id="divAppendix4" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp Appendix 4</legend>
                                            <div style="text-align: center;">73-5</div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">
                                                Policy instructions for new affiliation year 2022-23 of Maharishi Patanjali Sanskrit Sansthan Bhopal
 and criteria
                                            </div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">Appendix-4</div>
                                            <br />
                                            <br />
                                            1. Adjournment Motion of the Committee.<br />
                                            <br />
                                            2. Registration of Society Copy of Certificate issued by Registrar and Firm Society<br />
                                            <br />
                                            3. Certified Manual of the Society (issued by Registrar and Firm Society)<br />
                                            <br />
                                            4. Attested photocopy of the list of members of the Management Committee (Section 27) which is of the latest status.<br />
                                            <br />
                                            5. Information as follows including qualification and appointment date of teachers working for teaching
 including] (including Sanskrit qualified, Shastri / Acharya) as mentioned in the application
 Separately for each class and each subject in the applied Sanskrit school, teachers with desired educational qualification
 It is mandatory to have  The desired educational qualification implies that L.K.G.  Related to (Arun) for Praveshika
 Regarding H.S.  / Uttar Madhyamik and D.Ed./B.  T.I / P.T.C.  And in the subject related to the first to the middle
 Shastri and B.Ed.  / Education Shastri and Acharya / M.A.  (Sanskrit) and B.  Ed / Education
 Shastri is mandatory to be a qualified teacher.<br />
                                            <br />
                                            6. Registered photocopy of land/building ownership/rent deed and photo of the entire building<br />
                                            <br />
                                            7. Measles copy map of ownership of land / building, certified by urban body, gram panchayat<br />
                                            <br />
                                            8. If the present school building is on rent, then the photocopy of the registered or notarized rent deed<br />
                                            <br />
                                            9. Attested photocopy of the map of the present school building, Municipal Corporation, Municipality or Village
 By Panchayat.<br />
                                            <br />
                                            10. Inspection report of the District Education Officer with details<br />
                                            <br />
                                            11. Certified copy of the departmental permission payable by the District Education Officer<br />
                                            <br />
                                            12. Certified copy of equipment and materials available in the laboratory<br />
                                            <br />
                                            13 Attested photocopy of the last audit report (of the society)<br />
                                            <br />
                                            14. Certified records regarding the information about the playground of the school<br />
                                            <br />
                                            15. Potential class wise student strength<br />
                                            <br />
                                            16. Possible class wise time division circle<br />
                                            <br />
                                            17. Possible teacher wise time department cycle<br />
                                            <br />
                                            18. Institution's own certificate regarding the facilities tied to the disabled<br />
                                            <br />
                                            19. L.  Of.  Yes.  (Arun) UK  Yes.  (Uday) and for the students of class 1 to 4 there should be arrangement on the ground floor.<br />
                                            <br />
                                            20. The ground floor of the school building should not be more than the first floor and the second floor (three floors).
 Need self certification.<br />
                                            <br />
                                            21. Two postcard size color photographs of the building are attached.<br />
                                            <br />
                                            22. There should not be any disparity in the number of students of both the blocks of Pre-Madhyamik.<br />
                                            <br />
                                            23. Maharishi Patanjali Sanskrit Sansthan, M.P.  In Arun, Uday for classes 1st to 4th
 The prescribed norms should be fulfilled (Appendix-5).<br />
                                            <br />
                                            <br />
                                            <br />
                                            Note :- Whatever photocopies of the above records are attached, get them certified by the gazetted officer.

                                        </fieldset>
                                    </div>
                                </div>
                                <div id="step-10">
                                    <div class="row">
                                        <fieldset id="divAppendix5" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp Appendix 5</legend>
                                            <div style="text-align: center;">Appendix-5</div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">
                                                Maharishi Patanjali Sanskrit Institute<br />
                                                <br />
                                                Madhya Pradesh Bhopal<br />
                                                <br />
                                                Arun / Uday / Norms set for classes 1 to 4
                                            </div>
                                            <br />
                                            <br />
                                            1. Staff<br />
                                            <br />
                                            (1) 1 for 20 children<br />
                                            <br />
                                            (2) 20 on 1 Co.<br />
                                            <br />
                                            (3) Publication will be of the staff.<br />
                                            <br />
                                            (4) Police is mandatory for the appointment of staff in the school.<br />
                                            <br />
                                            (5) or against any member of the Society JJ et al.<br />
                                            <br />
                                            There should not be any samadhi.<br />
                                            <br />
                                            2. BhaWan<br />
                                            <br />
                                            (1) Schedule building for living in each<br />
                                            <br />
                                            (2) The building should have a security wall.<br />
                                            <br />
                                            (3) Adequate ventilation (air and light) should be arranged in the building.<br />
                                            <br />
                                            (4) Seperate rest room.
                                            <br />
                                            <br />
                                            (5) Bond free site.<br />
                                            <br />
                                            (6) Separate toilets for boys and girls with child friendly facilities.<br />
                                            <br />
                                            (7) clean clothes,towels soap should be kept below,and wash vasins etc.Shoud be installed below(not at a height).<br />
                                            <br />
                                            (8) Pantry for food etc.<br />
                                            <br />
                                            (9) There should be a field of play.<br />
                                            <br />
                                            (10) CCTV in the entire campus.  have cameras<br />
                                            <br />
                                            (11) There should also be a fire extinguisher.<br />
                                            <br />
                                            (12) The school building should be away from the road<br />
                                            <br />
                                            (13) The pond should not be open.<br />
                                            <br />
                                            3. Time-<br />
                                            <br />
                                            According to the National Child Protection and Education Policy 2013, 3 to 4 posts per day and
 (None residencial)School<br />
                                            <br />
                                            4. Teaching material-<br />
                                            <br />
                                            Study material on the basis of student number for each story as prescribed by Maharishi Patjati Sanskrit Sansthan
 be provided<br />
                                            <br />
                                            5. Library
 The reading material should also be suitable for each small child<br />
                                            <br />
                                            6. Sporting goods-<br />
                                            <br />
                                            1. Sports material supplied by M.C.D.<br />
                                            <br />
                                            2. Children should have places to play near the school.<br />
                                            <br />
                                            7. Health-<br />
                                            <br />
                                            First aid material, medicine kit, ORSU etc. Time material<br />
                                            <br />
                                            Involved in treatment material by registered medical practitioner<br />
                                            <br />
                                            8.  Entry-<br />
                                            <br />
                                            Children below three years of age should not be given admission in Assam Udyas.<br />
                                            <br />
                                            9. Records -<br />
                                            <br />
                                            (A) Name of children<br />
                                            <br />
                                            (B) State and nomination whose name is also the day of parents
 be marked<br />
                                            <br />
                                            (C) Attendance register also<br />
                                            <br />
                                            (D) All teachers / Kiti<br />
                                            <br />
                                            (E) Staff details register.<br />
                                            <br />
                                            (F) Karan also has all children<br />
                                            <br />
                                            (G) All the employees of the applicant institution Gazette et 2012 Junita Act<br />
                                            <br />
                                            According to 2015 Child Labor Act 1960 and Child Labor Rules 2016<br />
                                            <br />
                                            Responsibilities of School and Teachers<br />
                                            <br />

                                            1. P.T.A.  It should be formed every year with admission as well as within a month.
 75% of the parents will remain in the Guardian Teacher Association, of which 50% will be mothers, 25% will be fathers and 25% will be teachers.<br />
                                            <br />
                                            3. P.T.A.  The time period of P.T.A. will be of 2 years. Every year new P.T.A.  Will be formed<br />
                                            <br />
                                            4. There will be a meeting of Teacher-Parent Association every month, which will be included in the proceedings.
 P.T.A.  The main task of the KVS is to provide security, protection and proper environment to the children.<br />
                                            <br />
                                            Making food arrangements for proper nutrition of food items.
 7. Regular health check-up should be done by a registered doctor.<br />
                                            <br />
                                            8. Arrangement of medicine kit for basic first aid should be ensured<br />
                                            <br />

                                        </fieldset>




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
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
            <input type="button" id="btnHome" class="btn btn-info" style="background-color: #0040FF !important;" value="Home" onclick="javascript: CallHome('divHome');" />
        </div>
    </form>
</body>
</html>
