<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MPSSAttachmentShows.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.MPSSAttachmentShows" %>

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
                    <%----------End Header section ---------%><%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                        <span style="font-size: 20px">Attachments of Student Scholar Ship</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">

                        <table style="width: 98%; margin: 0 auto; font-size: 16px">
                            <tr>
                                <td style="text-align: center; font-size: 20px" colspan="7"><b><asp:Label ID="lblAppStatus" runat="server"></asp:Label></b>&nbsp; 
                                                    <asp:Label ID="lblEnrollType" runat="server" ></asp:Label>
                                   
                                                   <b>
                                                       <asp:Label ID="lblPayment" runat="server"></asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    &nbsp;</td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center" colspan="5"> <b>
                                    <asp:Label ID="AppID" runat="server"></asp:Label></b>&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9">
                                    </td>
                            </tr>
                            <tr id="trRollNo" runat="server">
                                <td style="text-align: center">
                                    &nbsp;</td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"> 
                                    <asp:Label ID="lblEnrollmentNo" runat="server" Font-Bold="true"></asp:Label></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center">
                                      <asp:Label ID="lblRollNo" runat="server" Font-Bold="true"></asp:Label></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9">
                                    </td>
                            </tr>
                        </table>
                        <%--Programme Table--%>
                        <asp:Panel ID="pnlSamagra" runat="server">
                          <div id="divENT" runat="server" class="table-responsive">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="5" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Samagra Details</b></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Aadhar Number.</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Samagra Family ID
                                        </th>

                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Samagra ID
                                        </th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: left;" class="auto-style1">Application Number</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtAadharNo" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtFamilyID" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtSamagraID" runat="server"></asp:Label>

                                            <asp:Label ID="SamagraNo" runat="server"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:Label ID="txtAppID" runat="server"></asp:Label>

                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtCardHolder" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                            </asp:Panel>
                          <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp&nbsp&nbsp&nbsp Attachment</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">Copy of Cancelled Cheque
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/cheque.jpg" name="ProfileCheque" Style="height: 180px" ID="imgCheque" />
                                                      

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                             <div id="divPassbook" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">Copy of Passbook
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/Passbook.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgPassbook" />
                                                       
                                                        
                                                      

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

        <br />
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
