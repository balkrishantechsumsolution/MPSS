<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="AckReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.NFBS.AckReceipt" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>

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
                    <h4 class="box-title register-num">National Family Benefit Scheme (NFBS)
                    </h4>
                </div>
                <div class="box-body box-body-open">

                    <asp:Panel ID="Panel1" runat="server" Style="margin: 0 auto; width: 800px; height: 1220px;">
                        <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px;">
                            <div style="margin: 0 auto; height: 1182px; width: 785px; border: 1px solid #000;">
                                <%---------Start Header section --------%>
                                <div style="height: 140px; width: 785px; border-bottom: 1px solid #999;">
                                    <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                    </div>
                                    <div style="float: right; margin: 10px 31px 0 0; font-size: 13px; display: none">
                                        <span style="font-weight: bold; display: none;">संदर्भ:</span> शा. नि. क्र. संकीर्ण १/२०१२/प्र.क्र.१८/ई-१,परिशिष्ट
                        “ब”, अर्ज “थ”
                                    </div>
                                    <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0;">
                                        <div style="height: 23px; width: 100px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                            Ref. No.
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
                                <div style="text-align: center; padding: 5px; background-color: #808080; color: #fff;"> <span style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">
                                    National Family Benefit Scheme (NFBS) </span> <br /><span style="font-size:15px">Social Security Impowerment of Person with Dissabilities Department</span>
                                </div>
                                <%----------End title section ---------%>
                                <%---------Start Applicant Section --------%>
                                <div style="margin: 30px auto; width: 708px; font-size: 13px;">
                                    <div style="padding: 6px 0 0 7px; font-weight: bold; border: 1px solid #999; background-color: #f3aba4;">
                                        Applicant Details
                                    </div>

                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <div style="float: left; height: 30px; width: 144px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Aadhar No.
                                    </div>
                                    <div style="float: left; height: 30px; width: 424px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none; border-left: none; border-right: none;">
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: right; height: 150px; width: 140px; border: 1px solid #999; border-top: none; padding: 0;">
                                        <asp:Image ID="Image3" runat="server" Height="150px" Width="140px" ImageAlign="Right" ImageUrl="~/WebApp/Kiosk/Images/photo.png" />
                                    </div>
                                    <div style="float: left; height: 30px; width: 144px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Full Name <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 424px; border-bottom: 1px solid #999; margin: 0; padding: 2px 0 0 7px;">
                                        <asp:Label ID="lblfullname_LL" runat="server"></asp:Label>
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 144px; border: 1px solid #999; padding: 5px 0 0 7px; border-top: none;">
                                        Gender <span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: left; height: 30px; width: 424px; padding: 0 0 0 7px; border-bottom: 1px solid #999; margin: 0;">
                                        <div style="float: left; width: 44px; border-right: 1px solid #999; height: 29px; padding: 5px 0 0 7px; background-color: #F3ABA4; margin-left: -7px; padding-left: 7px;">
                                            Male
                                        </div>
                                        <div style="float: left; width: 70px; border-right: 1px solid #999; height: 29px; padding: 5px 0 0 7px;">
                                            <asp:Label ID="lblmale" runat="server"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 65px; border-right: 1px solid #999; height: 29px; padding: 5px 0 0 7px; background-color: #F3ABA4;">
                                            Female
                                        </div>
                                        <div style="float: left; width: 70px; border-right: 1px solid #999; height: 29px; padding: 5px 0 0 7px;">
                                            <asp:Label ID="lblfemale" runat="server"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 55px; border-right: 1px solid #999; height: 29px; padding: 5px 0 0 7px; background-color: #F3ABA4;">
                                            Other
                                        </div>
                                        <div style="float: left; width: 80px; height: 30px; padding: 5px 0 0 7px;">
                                            <asp:Label ID="lblgender" runat="server" Visible="false"
                                                Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lbltrans" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 144px; border: 1px solid #999; padding: 2px 0 0 7px; border-top: none;">
                                        Date of Birth
                                    </div>
                                    <div style="float: left; height: 30px; width: 424px; border-bottom: 1px solid #999; padding: 0 0 0 7px;">
                                        <div style="float: left; width: 44px; border-right: 1px solid #999; height: 29px; padding-top: 2px; background-color: #F3ABA4; margin-left: -7px; padding-left: 7px;">
                                            Date
                                        </div>
                                        <div style="float: left; width: 70px; border-right: 1px solid #999; height: 29px; padding-top: 2px; padding-left: 7px;">
                                            <asp:Label ID="lbldate" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 65px; border-right: 1px solid #999; height: 29px; padding-top: 2px; padding-left: 7px; background-color: #F3ABA4;">
                                            Month
                                        </div>
                                        <div style="float: left; width: 70px; border-right: 1px solid #999; height: 29px; padding-top: 2px; padding-left: 7px;">
                                            <asp:Label ID="lblmonth" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 55px; border-right: 1px solid #999; height: 29px; padding-top: 2px; padding-left: 7px; background-color: #F3ABA4;">
                                            Year
                                        </div>
                                        <div style="float: left; width: 80px; height: 30px; padding: 2px 0 0 7px;">
                                            <asp:Label ID="lblyear" runat="server"></asp:Label>
                                        </div>
                                    </div>   
                                    <div class=" " style="float: left; height: 30px; width: 174px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; height: 160px;">
                                        Applicant Address <span style="color: #F00">*</span>
                                        <br />
                                        <span>(Please fill in the box with the following information:)</span>
                                        <ul style="margin: 4px 0 0 -15px; line-height: 19px;">
                                            <li style="font-size: 12px;">House / Apartment No.</li>
                                            <li style="font-size: 12px;">Building No. / Building Name </li>
                                            <li style="font-size: 12px;">Locality / Landmark</li>
                                            <li style="font-size: 12px;">Road / Street name </li>
                                        </ul>
                                    </div>
                                    <div class=" " style="float: right; height: 25px; width: 534px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none; height: 130px;">
                                        <div style="height: 65px;">
                                            <asp:Label ID="lblapplicant_address" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblapp_tehsil" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblapp_dist" runat="server" Font-Size="15px"></asp:Label>
                                            <asp:Label ID="lblpin_app" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="height: 30px; border: 1px solid #999; border-left: none; border-right: 0; margin-left: -7px;">
                                            <div style="float: left; width: 60px; border-right: 1px solid #999; height: 28px; background-color: #f3aba4; padding-left: 7px;">
                                                Village
                                            </div>
                                            <div style="float: left; width: 190px; border-right: 1px solid #999; height: 28px; padding-left: 7px;">
                                                <asp:Label ID="lblvillage" runat="server" Font-Size="15px"></asp:Label>
                                            </div>
                                            <div style="float: left; width: 60px; height: 28px; padding-left: 7px; border-right: 1px solid #999; background-color: #f3aba4;">
                                                Taluka
                                            </div>
                                            <div style="float: left; width: 190px; height: 28px; padding-left: 7px;">
                                                <asp:Label ID="lbltaluka" runat="server" Font-Size="15px"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                        </div>
                                        <div style="float: left; width: 60px; border-right: 1px solid #999; height: 28px; background-color: #f3aba4; padding-left: 7px; margin-left: -7px;">
                                            District
                                        </div>
                                        <div style="float: left; width: 190px; border-right: 1px solid #999; height: 28px; padding-left: 7px;">
                                            <asp:Label ID="lbldist" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 60px; height: 28px; padding-left: 7px; border-right: 1px solid #999; background-color: #f3aba4;">
                                            PIN
                                        </div>
                                        <div style="float: left; width: 190px; height: 28px; padding-left: 7px;">
                                            <asp:Label ID="lblpin" runat="server" Font-Size="15px"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="" style="float: left; height: 30px; width: 174px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none;">
                                        Mobile No.
                                    </div>
                                    <div style="float: right; height: 30px; width: 534px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none;">
                                        <asp:Label ID="lblMobile" runat="server" Font-Size="15px"></asp:Label>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 174px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none;">
                                        E-Mail ID
                                    </div>
                                    <div style="float: right; height: 30px; width: 534px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none;">
                                        <asp:Label ID="lblemail" runat="server" Font-Names="Arial"></asp:Label>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                </div>
                                <%----------End Applicant Section ---------%>
                                <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                </div>
                                <%----------Start Document Section ---------%>
                                <div style="margin: 40px auto; width: 708px; font-size: 13px;">
                                    <div style="border: 1px solid #999; background-color: #f3aba4; border-bottom: none; width: 708px; margin: 0 auto; padding: 6px 0 0 7px; font-size: 17px; font-weight: bold;">
                                        List of essential documents (but not enclosed with the application)
                        <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                        </div>
                                        <div>
                                        </div>
                                    </div>
                                    <div class="" style="height: 300px; font-weight: normal;">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;"
                                                    width="35px">Sl.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;"
                                                    width="200px">
                                                    <span style="font-weight: bold;">Document Name
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"
                                                    width="490px">Particulars of document
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;"
                                                    width="35px">1.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;"
                                                    width="200px">
                                                    </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"
                                                    width="490px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;"
                                                    width="35px">2.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;"
                                                    width="200px">
                                                    </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"
                                                    width="490px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;"
                                                    width="35px">3.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;"
                                                    width="200px">
                                                    </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"
                                                    width="490px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;"
                                                    width="35px">4.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none;"
                                                    width="200px">
                                                  </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"
                                                    width="490px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;"
                                                    width="35px">5.
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-right: none;"
                                                    width="200px">
                                                     </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: center;" width="490px">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <%----------End Document Section ---------%>
                                <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                </div>
                                <%---------Start Contact Section --------%>

                                <div style="margin: 30px auto; width: 708px; font-size: 13px;display:none;">

                                    <div style="background-color: #f3aba4; width: 708px; border: 1px solid #999; padding: 6px 0 0 7px; font-size: 17px; font-weight: bold;">
                                        Contact Details
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>

                                    <div class="" style="float: left; height: 30px; width: 174px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none;">
                                        Full Name<span style="color: #F00">*</span>
                                    </div>
                                    <div style="float: right; height: 30px; width: 534px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none;">
                                        <asp:Label ID="lblemergencyname" runat="server" Font-Size="15px"></asp:Label>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <div class="" style="float: left; height: 30px; width: 174px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none;">
                                        Mobile / Phone No.
                                    </div>
                                    <div style="float: right; height: 30px; width: 534px; border: 1px solid #999; padding: 6px 0 0 7px; border-top: none; border-left: none;">
                                        <asp:Label ID="lblemergencymob" runat="server" Font-Size="15px"></asp:Label>
                                    </div>
                                    <div style="clear: both; margin: 0; line-height: 0; padding: 0;">
                                    </div>
                                    <p style="margin: 7px 0px 0 5px;">
                                        (<span style="color: #F00">*</span> Mandatory Information)
                                    </p>
                                    <div style="margin: 20px 0 0; border-top: 1px solid
        #999; display: none; background-color: #f3aba4; width: 708px; border: 1px solid #999; border-bottom: none; padding: 6px 0 0 7px; font-size: 17px; font-weight: bold;">
                                        Self Attestation
                                    </div></div>
                                    <div class="linerow" style="height: 100px; font-weight: normal; display:none">                                        
                                        <div style="height: 65px; width: 299px; float: left; margin: 27px 0 0 40px;">
                                            <div style="height: 30px; width: 70px; float: left;">
                                                Place :
                                            </div>
                                            <div style="height: 30px; width: 195px; float: left;">
                                                _________
                                            </div>
                                            <div style="height: 30px; width: 70px; float: left;">
                                                Date:
                                            </div>
                                            <div style="height: 30px; width: 195px; float: left;">
                                                _________
                                            </div>
                                        </div>
                                        <div style="height: 65px; width: 299px; float: right; margin: 27px 38px 0 0">
                                            <div style="height: 0px; width: 130px; float: left;">
                                                
                                            </div>
                                            <div style="height: 30px; width: 160px; float: left;">
                                               
                                            </div>
                                            <div style="height: 30px; width: 130px; float: left;">
                                                
                                            </div>
                                            <div style="height: 30px; width: 250px; float: right;">
                                                Designated Officer's Signature & Seal
                                            </div>
                                        </div>
                                    </div>
                                
                                <%----------End Contact Section ---------%>
                            </div>
                        </div>
                        <div class="clear" style="page-break-before: always;">
                            &nbsp;
                        </div>
                        <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px;">
                            <div style="margin: 0 auto; height: 1182px; width: 785px; border: 1px solid #000;">
                                
                                <div style="border: 1px solid #999; background-color: #f3aba4; border-bottom: none; width: 708px; margin: 35px auto 0px; padding: 6px 0 0 7px; font-size: 17px; font-weight: bold;">
                                    Acknowledge Receipt
                        <div style="clear: both; margin: 0; line-height: 0; padding: 0;"></div>
                                    <div>
                                    </div>
                                </div>
                                <div class="" style="font-weight: normal; width: 708px; margin: 0 auto;">

                                    <table cellpadding="5" cellspacing="0" class="table table-bordered table-striped" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                <strong>Application Detail</strong></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="tokanno0" runat="server" CssClass="lbl_property" Text="Designated Officer"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                &nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="tokanno1" runat="server" CssClass="lbl_property" Text="Office Address"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                &nbsp;</td>
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
                                        <%--<tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label81" runat="server" Text="Benificery Name"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblBenificery" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                            </td>
                                        </tr>--%>
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
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Application Fee</td>
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
                                                <asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label></td>
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
                            
                            <div class="linerow" style="height: 100px; font-weight: normal;">                                        
                                        <div style="height: 65px; width: 299px; float: left; margin: 27px 0 0 40px;">
                                            <div style="height: 30px; width: 70px; float: left;">
                                                Place :
                                            </div>
                                            <div style="height: 30px; width: 195px; float: left;">
                                                _________
                                            </div>
                                            <div style="height: 30px; width: 70px; float: left;">
                                                Date:
                                            </div>
                                            <div style="height: 30px; width: 195px; float: left;">
                                                _________
                                            </div>
                                        </div>
                                        <div style="height: 65px; width: 299px; float: right; margin: 27px 38px 0 0">
                                            <div style="height: 0px; width: 130px; float: left;">
                                                
                                            </div>
                                            <div style="height: 30px; width: 160px; float: left;">
                                               
                                            </div>
                                            <div style="height: 30px; width: 130px; float: left;">
                                                
                                            </div>
                                            <div style="height: 30px; width: 250px; float: right;">
                                                Designated Officer's Signature & Seal
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
