<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="BirthAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Birth.BirthAcknowledgement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:Infomation runat="server" ID="Infomation" />--%>

        <div class="row" style="margin-top: 25px;">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">HEALTH AND WELFARE DEPARTMENT
                    </h4>
                </div>
                <div class="box-body box-body-open">

                    <asp:Panel ID="Panel1" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                        <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px;">
                            <div style="margin: 0 auto; height: 1182px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                                <%---------Start Header section --------%>
                                <div style="height: 140px; width: 785px;">
                                    <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                    </div>

                                    <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0;">
                                        <div style="height: 23px; width: 100px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                            Trans. No.
                                        </div>
                                        <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                            <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div style="height: 23px; width: 100px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                            Trans. Date
                                        </div>
                                        <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                            <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>

                                </div>

                                <%----------End Header section ---------%>
                                <%---------Start Title section --------%>
                                <div style="text-align: center; font-size: 20px; border: 1px solid #999; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                    BIRTH Certificate
                                </div>
                                <%----------End title section ---------%>
                                <%---------Start Applicant Section --------%>
                                <div style="margin: 30px auto; width: 708px; font-size: 13px;">
                                    <div style="padding: 6px 0 0 7px; font-weight: bold; border: 1px solid #999; background-color: #f3aba4;">
                                        Applicant Details
                                    </div>

                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <div style="float: left; height: 30px; width: 120px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Aadhar No.
                                    </div>
                                    <div style="float: left; height: 30px; width: 170px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none; border-left: none; border-right: none;">
                                        <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 125px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Mobile No.<span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 153px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: right; height: 150px; width: 140px; border: 1px solid #999; border-top: none; padding: 0;">
                                        <%--<asp:Image ID="Image3" runat="server" Height="150px" Width="140px" ImageAlign="Right" ImageUrl="~/WebApp/Kiosk/Images/photo.png" />--%>
                                        <img class="form-control" runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 149px; width: 138px;" id="ProfilePhoto" />
                                    </div>
                                    <div style="float: left; height: 30px; width: 120px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Applicant Name <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 170px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 125px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Relation with Child<span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 153px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblRelation" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 120px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Name of Child<span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 170px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblChild" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 125px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Gender<span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 153px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 120px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Father Name <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 170px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: left; height: 30px; width: 125px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Mother Name <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 153px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblMother" runat="server"></asp:Label>
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 120px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Date of Birth <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 170px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblDOB" runat="server" Text="22/08/2016"></asp:Label>
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 125px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Place of Birth <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 153px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="Label6" runat="server" Text="22/08/2016"></asp:Label>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <div class=" " style="float: left; height: 30px; width: 150px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; height: 145px;">
                                        Birth Place Address <span style="color: #F00">*</span>
                                        <br />
                                        <ul style="margin: 4px 0 0 -25px; line-height: 19px;">
                                            <li style="font-size: 12px;">Name of Hospital</li>
                                            <li style="font-size: 12px;">House / Apartment No.</li>
                                            <li style="font-size: 12px;">Building No. / Building Name </li>
                                            <li style="font-size: 12px;">Locality / Landmark</li>
                                            <li style="font-size: 12px;">Road / Street name </li>
                                        </ul>
                                    </div>
                                    <div class=" " style="float: right; height: 25px; width: 558px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none; height: 145px;">
                                        <div style="height: 80px;">
                                            <asp:Label ID="lblapplicant_address" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblapp_tehsil" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblapp_dist" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblpin_app" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="height: 30px; border: 1px solid #999; border-left: none; border-right: 0; margin-left: -7px;">
                                            <div style="float: left; width: 60px; border-right: 1px solid #999; height: 28px; background-color: #f3aba4; padding: 5px 0 0 7px;">
                                                Village
                                            </div>
                                            <div style="float: left; width: 190px; border-right: 1px solid #999; height: 28px; padding-left: 7px;">
                                                <asp:Label ID="lblvillage" runat="server" Font-Size="15px"></asp:Label>
                                            </div>
                                            <div style="float: left; width: 60px; height: 28px; padding: 5px 0 0 7px; border-right: 1px solid #999; background-color: #f3aba4;">
                                                Taluka
                                            </div>
                                            <div style="float: left; width: 190px; height: 28px; padding: 5px 0 0 7px;">
                                                <asp:Label ID="lbltaluka" runat="server" Font-Size="15px"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                        </div>
                                        <div style="float: left; width: 60px; border-right: 1px solid #999; height: 28px; background-color: #f3aba4; padding: 5px 0 0 7px; margin-left: -7px;">
                                            District
                                        </div>
                                        <div style="float: left; width: 190px; border-right: 1px solid #999; height: 28px; padding: 5px 0 0 7px;">
                                            <asp:Label ID="lbldist" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 60px; height: 28px; padding: 5px 0 0 7px; border-right: 1px solid #999; background-color: #f3aba4;">
                                            PIN
                                        </div>
                                        <div style="float: left; width: 190px; height: 28px; padding: 5px 0 0 7px;">
                                            <asp:Label ID="lblpin" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                </div>
                                <%----------End Applicant Section ---------%>
                                <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                </div>
                            </div>
                        </div>
                        <div class="clear" style="page-break-before: always;">
                            &nbsp;
                        </div>
                        <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px;">
                            <div style="margin: 0 auto; height: 1182px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                                <%---------Start Header section --------%>
                                <div style="height: 140px; width: 785px; border-bottom: 1px solid #999;">
                                    <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                        <img alt="Logo" src="../images/mpo_logo.png" style="width: 90px; margin: 25px 0px 0px 33px;" />
                                    </div>

                                    <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                        <img src="../Images/QRCode.png" style="width: 100px" />
                                    </div>
                                </div>
                                <%----------End Header section ---------%>
                                <%---------Start Title section --------%>
                                <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                    Acnowledgement Receipt
                                </div>
                                <%----------End title section ---------%>
                                <div class="clear" style="page-break-before: always;">
                                    &nbsp;
                                </div>

                                <div class="" style="height: 300px; font-weight: normal; width: 708px; margin: 0 auto;">

                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                <strong>Application Detail</strong></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="tokanno" runat="server" CssClass="lbl_property" Text="Application ID"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="TokenNo" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label77" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label79" runat="server" CssClass="lbl_property" Text="Applicant Name"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label81" runat="server" Text="Beneficiary Name"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblBenificery" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label82" runat="server" Text="Application For"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblCertificateName" runat="server" CssClass="lbl_value"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><strong>Payment Detail</strong></td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Transaction ID</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><span id="lblTrnsID" runat="server" style="font-weight: bold;">16505101000000000085</span></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Transaction Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;">31/05/2016</span></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Transaction Amount</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblAppFee" runat="server" Text="Rs. 20.00"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Portal Fee + Service Tax</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                                + <i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Total Amount</td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblTotalFee" runat="server" Text="Rs. 22.75 (Twenty Two Rupees and Seventy Five Paise)"></asp:Label>
                                                <asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Three Rupees and zero paise)"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Application Delivery Detail</strong></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Signing Authority</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Tahsildar</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">To Be Delivered by</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lbl1Date" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Appellate Authority</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Sub-Divisional Officer</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Appellate Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lbl2Date" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Revisional Appellate Authority</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Additional Collector</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Appellate Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lbl3Date" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input id="btnPrint" type="button" value="Print" class="btn btn-success" />
                    <a href="../Forms/BasicDetail.aspx" class="btn btn-blue">Home</a>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%----END of Button-----%>
    </div>
</asp:Content>
