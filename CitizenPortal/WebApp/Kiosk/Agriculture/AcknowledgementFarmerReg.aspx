<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcknowledgementFarmerReg.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Agriculture.AcknowledgementFarmerReg" %>
<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 1182px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 785px; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                        Trans. No.
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                        <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                        Trans. Date
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                        <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                    <%--<img src="../Images/QRCode.png" style="width: 100px" />--%>
                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                </div>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Farmer Registration </asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px">Agriculture Department</span>

                            </div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
                            <div style="margin: 10px auto; width: 708px; font-size: 13px;">

                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <b>Details of Farmer</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label5" runat="server" Text="ProfileID/Aadhaar No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td rowspan="5" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 135px;" id="ProfilePhoto" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            Name of Head of Family (HOF)
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                             <asp:Label ID="lblNameofhof" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                             <asp:Label ID="Father" runat="server">Father Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="lblFather1" runat="server">Age</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                             <asp:Label ID="lblage" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label2" runat="server">Gender</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Relation with HOF</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                             <asp:Label ID="lblrelationwithhof" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblCategory2" runat="server">Voter ID Card No.</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                         <asp:Label ID="lblvoterid" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Category</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblCategory" runat="server"></asp:Label></td>
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td rowspan="2" style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                            Property Details
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                         <asp:Label ID="Label10" runat="server">District</asp:Label>
                                            
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="lbldistrict" runat="server" Font-Size="15px"></asp:Label>
                                           
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label15" runat="server">Block</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                            <asp:Label ID="lblblock" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                           Gram Panchayat
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGramPanchayat" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label22" runat="server">Village</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPVillageCode" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                            <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <asp:Label ID="lblapplicant_address" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;" rowspan="2">
                                            <asp:Label ID="Label20" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label21" runat="server">Village/GP</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblvillage" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label23" runat="server">Block</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                            <asp:Label ID="lbltaluka" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label30" runat="server">District</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lbldist" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblpin" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <%--<table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left; " colspan="5"><b>Family Members Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 0; text-align: left; " colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">S.No</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Members</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Relation with HOF</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Age</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Nominated</td>
                                          </tr>
                                          <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                </table>
                                <br />--%>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Account Details of Beneficiary</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label4" runat="server" Text="Account Holder's Name"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                            <asp:Label ID="lblAcHolder" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Bank Account Number</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblAcNo" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">IFSC Code</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblIFSCCode" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0" width="100%" style="">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="100%">
                                </asp:GridView>


                                <%--<table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 20px;">Sl. </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; over-flow: nowrap;">Document Name </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; width: 200px;">Particulars of document </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">1.
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; white-space: nowrap;">BPL Card of Family</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">Attached</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">2.
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;">Age Proof/Voter Card of the deceased</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">Attached</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;">3.
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-right: none;">Death Certificate </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;">Attached</td>
                                    </tr>
                                     <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;">4.
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-right: none;">First Page of Bank Pass Book</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;">Attached</td>
                                    </tr>
                                     <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;">5.
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-right: none;">ID Proof of the Claimant</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;">Attached</td>
                                    </tr>
                                </table>--%>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Payment Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label1" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="TokenNo" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label3" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <%-- <tr style="display:none">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>--%>
                                    <tr style="display: none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblAppFee" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                            + <i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>Rs. 
                                            <asp:Label ID="lblTotalFee" runat="server" Text=""></asp:Label>
                                            <%-- <asp:Label ID="Label9" runat="server" Text="Rs. 22.75" ></asp:Label>--%>
                                            <asp:Label ID="lblAmt" runat="server"></asp:Label></td>
                                    </tr>
                                </table>

                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Application Delivery Detail</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Designated Officer</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">BDO</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Expected Date of Delivery</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="lbl1Date" runat="server" Text="30 Days"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Appellate Authority</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Sub-Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                        <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; ">Apallate Date</td>--%>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <%--<asp:Label ID="lbl2Date" runat="server" Text=""></asp:Label>--%></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Revisional Authority</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <%--<asp:Label ID="lbl3Date" runat="server" Text=""></asp:Label>--%></td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Current Status</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Authorised Person</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Additional Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Status</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label8" runat="server" Text="Pending for Acceptance"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="Label6" runat="server" Text="Office Address"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label33" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label34" runat="server" Text="Contact No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label35" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                            </div>
                        </div>
                    </div>
                    <div class="clear" style="page-break-before: always;">&nbsp;</div>
                    <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important; width:180px; height:30px; border:none; border-radius:2px; color:#fff;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
