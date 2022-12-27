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
                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS1" runat="server" Text="LKG" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS2" runat="server" Text="UKG" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS3" runat="server" Text="Class 1-4" GroupName="CRCS" Checked="true" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS4" runat="server" Text="Praveshika" GroupName="CRCS" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS5" runat="server" Text="Purmadhima" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton  Enabled="false"  ID="rbCRCS6" runat="server" Text="Uttarmadhima" GroupName="CRCS"/>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">Society Name and Address</label>
                                                    <asp:TextBox  Enabled="false"  ID="txtSocietyName" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Society Name and Address"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSocietyName" Display="Dynamic"
                                                            ErrorMessage="Please Enter Society Name and Address." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">School Name</label>
                                                    <asp:TextBox  Enabled="false"  ID="txtSchoolName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSchoolName" Display="Dynamic"
                                                            ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">School Address</label>
                                                    <asp:TextBox  Enabled="false"  ID="txtSchoolAddress" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSchoolMobile" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSoceityRegNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSoceityRegDate" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSoceityValDate" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtPANNO" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSoceityNoOfMember" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyDirectorName" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyPost" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyMobileNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSocietyMobileNo" Display="Dynamic"
                                                        ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory">Other Operated Society School Name and Address</label>
                                                <asp:TextBox  Enabled="false"  ID="txtSocietyOtherOperated" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Other operate Society School Name and Address"></asp:TextBox>

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
                                            <asp:RadioButton  Enabled="false"  ID="rbOAreaSchoolOperated1" runat="server" Text="Rural" GroupName="rbOAreaSchoolOperated1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:RadioButton  Enabled="false"  ID="rbOAreaSchoolOperate2" runat="server" Text="Urban" GroupName="rbOAreaSchoolOperated1" />

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
                                            <asp:TextBox  Enabled="false"  ID="txtMunicipalCorp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtDisSchoolHeadQuater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPoliceSt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPoliceStDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPoliceStDivision" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPolicePhNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHighSchDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrGovtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHighSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNrPvtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:RadioButton  Enabled="false"  ID="rbSchoolType1" runat="server" Text="Co-ED" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton  Enabled="false"  ID="rbSchoolType2" runat="server" Text="Boys" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton  Enabled="false"  ID="rbSchoolType3" runat="server" Text="Girls" GroupName="rbSchoolType1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton  Enabled="false"  ID="rbSchoolType4" runat="server" Text="Hostel" GroupName="rbSchoolType1" />

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

                                            <asp:RadioButton  Enabled="false"  ID="rbSocietyBrd1" runat="server" Text="Yes" GroupName="rbSocietyBrd1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton  Enabled="false"  ID="rbSocietyBrd2" runat="server" Text="No" GroupName="rbSocietyBrd1" />

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
                                            <asp:TextBox  Enabled="false"  ID="txtBrdUni" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtFromDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtRegNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtRegDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtRunCommitteeSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSchPraveshika" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                Sankiya details of Sarup Awasi / Garwasi Hostel Boys and Girls of Sanskrit School par class
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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetLKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetUKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetCls14" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPrav" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPrathma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsDuti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Porave Prathakhand
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPoravePth" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPoraveAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPoraveUtt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtSankiyadetClsPoraveUttAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgCheque" />
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
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgPassbook" />
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
                                                <asp:TextBox  Enabled="false"  ID="txtHeadMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtHeadMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtPrinMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtPrinMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Shiksha Sharstri
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtMSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtMSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Shiksha Sharstri
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtMSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtMSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtMSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtPQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtPQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Shiksha Sharstri
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtPQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtPQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtPQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtHCQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtHCQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Shiksha Sharstri
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtHCQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtHCQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtHCQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Shiksha Sharstri
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtAQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAQTPTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtAssitTeachSci" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtStudMed" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtFeesPrathama" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Purvamadiyma
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtFeesPurvamadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtFeesUttarmadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtLedger" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtAssistantOff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtFourthGrade" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                From Class
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                To Time
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                To Class
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtAFTMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                From Class
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtAFTMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                To Time
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtAFTMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                To Class
                                            </label>
                                            <asp:TextBox  Enabled="false"  ID="txtAFTMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtKhasra" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtRentAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtRentOwnerAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                    <asp:TextBox  Enabled="false"  ID="txtAreaSchLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                    <asp:TextBox  Enabled="false"  ID="txtAreaSchBuildLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                    <asp:TextBox  Enabled="false"  ID="txtTotalAreaSchBuild" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                    <asp:TextBox  Enabled="false"  ID="txtTotalAreaSchBuildEmty" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFClsStudy" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtFDArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Sqaure Feet
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtFDSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsTEACH" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsTEACHArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Sqaure Feet
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsTEACHSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsLabLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsLabLibArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Sqaure Feet
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtNoOFRoomsLabLibSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtPlayArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Sqaure Feet of PlayGround 
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtPlaySqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtTotalNoToil" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtTotalNoToilGl" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtTotalNoToilBY" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtEqipWater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSubLabNum" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                            <asp:TextBox  Enabled="false"  ID="txtSubLabArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                Sqaure Feet of Subject wise laboratories 
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox  Enabled="false"  ID="txtSubLabSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtNoBooks" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtAreaLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Sqaure Feet of Libraries 
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox  Enabled="false"  ID="txtSqFTLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotFurt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotFurtGB" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotChaires" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotBenches" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotFurtStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotChairStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotAlmariresStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    Eelectricity Provided
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton  Enabled="false"  ID="rbElectric1" runat="server" Text="Yes" GroupName="rbElectric1" Checked="true" />

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">

                                                <asp:RadioButton  Enabled="false"  ID="rbElectric2" runat="server" Text="No" GroupName="rbElectric1" />
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
                                                <asp:TextBox  Enabled="false"  ID="txtTotComp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtTotPrinter" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtTotFaxes" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtTotOther" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtTotFireExt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                                <asp:TextBox  Enabled="false"  ID="txtSummittedAmt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

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
                                            <asp:TextBox  Enabled="false"  ID="txtPhyHandStudFact" runat="server" ToolTip="District"  CssClass="form-control"></asp:TextBox>

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
                                            <asp:RadioButton  Enabled="false"  ID="rbPhyHandStudAdPrv1" runat="server" Text="Yes" GroupName="rbPhyHandStudAdPrv1" Checked="true" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton  Enabled="false"  ID="rbPhyHandStudAdPrv2" runat="server" Text="No" GroupName="rbPhyHandStudAdPrv1" />
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                </fieldset>
                              
                                <%---Start of Button----%>
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
