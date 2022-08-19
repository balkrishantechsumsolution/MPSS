<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="SeedReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Seed.SeedReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>::RECIEPT SEED LICENSING APPLICATION FORM ::</title>

    <script type="text/javascript">
        function PrintReciept(contents) {

            var PrintContent = $(contents).html();
            var frame1 = $('<iframe />');
            frame1[0].name = "frame1";
            frame1.css({ "position": "absolute", "top": "-1000000px" });
            $("body").append(frame1);
            var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
            frameDoc.document.open();
            //Create a new HTML document.
            frameDoc.document.write('<html><head><title>Reciept</title>');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/bootstrap.min.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/metisMenu.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/timeline.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/style.admin.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/bootstrap.min.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/StyleSheet1.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/timeline.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/StyleSheet1.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/StyleSheet3.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/StyleSheet4.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/style.admin.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/bootstrap.min.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/sb-admin-2.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/morris.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" />');
            frameDoc.document.write('<link href="/WebApp/Common/Styles/beyond.css" rel="stylesheet" />');
            frameDoc.document.write('<style>' + PrintContent + '{margin:50px;}@page {size: auto;margin-bottom:10px;}a[href]:after{content:none!important}.bs-callout-info{border-left-color:#1b809e}.bs-callout{background-color:#fff;padding:20px;margin:20px 0;border:1px solid #ddd;border-left-width:5px;border-radius:3px;}#btnsubmit{display:none;}.box-body{border:1px solid #afafaf!important;}</style>');
            frameDoc.document.write('</head><body>');
            frameDoc.document.write(PrintContent);

            frameDoc.document.write('</body></html>');
            frameDoc.document.close();

            setTimeout(function () {
                window.frames["frame1"].focus();
                window.frames["frame1"].print();
                frame1.remove();
            }, 500);

        };

    </script>
    <style>
        a[href]:after {
            content: none !important;
        }

        .bs-callout-info {
            border-left-color: #1b809e;
        }

        .bs-callout {
            background-color: #fff;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 5px;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div>
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title register-num">SEED LICENSING APPLICATION FORM 
                        </h4>
                        <h4 class="box-title register-num">Application Number:   
                        <asp:Label ID="lblApp_no" runat="server"></asp:Label></h4>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 box-container">
                    <div class="box-heading mTop15">
                        <h4 class="box-title">Attached Photograph
                        </h4>
                    </div>
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Image ID="imgPhoto" runat="server" Width="90px" Height="110px" />
                    </div>
                </div>

                <div class="col-md-9 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title register-num">DETAILS ABOUT SRC ISSUING AUTHORITY
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="form-group col-lg-2">
                                <asp:Label ID="Label2" runat="server" Text="Notified Authority"></asp:Label>
                            </div>
                            <div class="form-group col-lg-10">
                                <asp:Label runat="server" ID="lblNotifyAthority"></asp:Label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="form-group col-lg-2">
                                <asp:Label runat="server" ID="lblHeadingAthorityPlaceorDistrict"></asp:Label>

                            </div>
                            <div class="form-group col-lg-10">
                                <asp:Label runat="server" ID="lblAthorityPlace"></asp:Label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="form-group col-lg-2">
                                <asp:Label runat="server" ID="lblHeadingAthorityStateorOffice"></asp:Label>
                            </div>
                            <div class="form-group col-lg-10">
                                <asp:Label runat="server" ID="lblAthorityState"></asp:Label>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="table-responsive bs-callout bs-callout-info" style="border-left-color: #1b809e;">
                <table class="table table-bordered table-striped" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="4" class="bg-success">APPLICANT'S INFORMATION
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Bussiness Type :</label>
                            </div>
                            <%-- <asp:RequiredFieldValidator ID="rfvinput1" runat="server" ControlToValidate="input1" Display="Dynamic" ErrorMessage="Please Enter First Name" SetFocusOnError="true" ValidationGroup="one" CssClass="msg"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label runat="server" ID="lblBussinessType" Text="Dealer"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Application Date :</label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="lbltodaydate" runat="server"> </asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Name of Firm :
                                </label>
                            </div>
                            <%-- <asp:RequiredFieldValidator ID="rfvinput1" runat="server" ControlToValidate="input1" Display="Dynamic" ErrorMessage="Please Enter First Name" SetFocusOnError="true" ValidationGroup="one" CssClass="msg"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtFirmName" runat="server" placeholder="Name of Firm"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Applicant Type :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlAppType" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Applicant's Name :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtApplicantName" runat="server" placeholder="Applicant's Name"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Postal Address :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPAddress" runat="server" placeholder="Postal Address"
                                    TextMode="MultiLine"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    State :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="lblPState" Text='Odisha' runat="server"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    District :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlPDistrict" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Block/NAC/Municipality :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlPBlock" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Email-ID :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPEmail" runat="server" placeholder="Email-ID"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Pin Code:
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPPinCode" runat="server" placeholder="Pin Code" MaxLength="6"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Mobile No :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPmobileNo" runat="server" placeholder="Mobile No" MaxLength="10"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Telephone No :</label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPtelephoneNo" runat="server" MaxLength="15" placeholder="Telephone No"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Photo ID Type :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlPhotoIdType" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Photo ID Number :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtPhotoIdNumber" runat="server" placeholder="Photo ID Number"></asp:Label>
                            </div>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                </table>
            </div>
            <div class="table-responsive bs-callout bs-callout-info" style="border-left-color: #1b809e;">
                <table class="table table-bordered table-striped" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="4" class="bg-success">BUSINESS ADDRESS DETAILS
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Address :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtBAddress" runat="server" placeholder="Business Address"
                                    TextMode="MultiLine"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    State :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="lblBstate" runat="server" Text="Odisha"> </asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    District :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlBdistrict" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Pin Code :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtBPinCode" runat="server" placeholder="Pin Code" MaxLength="6"></asp:Label>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Block/Municipality/NAC :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlBBlock" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">

                                <asp:Label runat="server" ID="lblGP" CssClass="info"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="ddlGP" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="table-responsive bs-callout bs-callout-info" style="border-left-color: #1b809e;">
                <table class="table table-bordered table-striped" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="4" class="bg-success">SOURCE OF SEED <span style="font-weight: bold;">NOTE : PLEASE FILL THE INDIVIDUAL SOURCE OF SEED AND SAVE.</span>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Company Type :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="rdoCompanyType" runat="server">
                                </asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Company Name :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtCompanyName" runat="server" placeholder="Company Name"></asp:Label>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Address :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtSourceOfSeedAddress" runat="server" placeholder="Address"
                                    TextMode="MultiLine"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Principal Certificate (Company wise)</label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <a id="FuPrincipalCertificate" runat="server" class="info">View</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="table table-bordered table-striped" style="border-collapse: collapse;" id="TbleOwnComanyDtls" runat="server">
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Processing Regd. No :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtProcessRegNo" runat="server" placeholder="Processing Regd. No"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Issue Date :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtIssueDate" runat="server" placeholder="dd/mm/yyyy"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Valid Upto :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtValiUpto" runat="server" placeholder="dd/mm/yyyy"></asp:Label>
                            </div>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                </table>
            </div>
            <div class="table-responsive bs-callout bs-callout-info" style="border-left-color: #1b809e;">
                <table class="table table-bordered table-striped" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="4" class="bg-success">DOCUMENTS DETAILS <span style="font-weight: bold;">NOTE : PLEASE TAKE THE FOLLOWING DOCUMENTS TO THE NOTIFIED AUTHORITY </span>
                        </th>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    <asp:Label ID="chkDocDtls" runat="server">
                                    </asp:Label>

                                </label>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
            <div class="table-responsive bs-callout bs-callout-info" style="border-left-color: #1b809e;">
                <table class="table table-bordered table-striped" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="4" class="bg-success">PAYMENT DETAILS
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Treasury Name :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtTreasuryName" runat="server" placeholder="Treasury Name"></asp:Label>

                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Challan Number :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtChallanNumber" runat="server" placeholder="Challan Number"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Challan Date :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtChallanDate" runat="server" placeholder="Challan Date"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <label class="info">
                                    Amount :
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="input-group input-group-sm">
                                <asp:Label ID="txtAmount" runat="server" placeholder="Amount"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="text-center">
                            <input type="button" value="Print" id="btnsubmit" onclick="PrintReciept('#page-wrapper');" class="btn btn-info" />
                            <%-- <asp:Button ID="btnsubmit" runat="server" OnClientClick="return printReciept();" CssClass="btn btn-info" Text="Print" />--%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
