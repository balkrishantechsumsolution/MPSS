<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ProvisionalSU.Acknowledgement" %>

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
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1091px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1083px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <table style="width: 100%">
                                <tr>
                                    <td rowspan="3"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 120px;" />
                                    </td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</td>
                                                <td></td>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <%--  <img src="../Images/QRCode.png" style="width: 100px" />--%>
                                        <uc1:QRCode runat="server" ID="QRCode1" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label ID="lblCertificateName" runat="server" CssClass="lbl_value" Text=""></asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px"></span>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top; height: 924px;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label33" runat="server" Text="Application No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblAppNo" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Label5" runat="server" Text="Aadhaar No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                                    </td>
                                                    <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="width: 138px;" id="ProfilePhoto" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
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
                                                        <asp:Label ID="lblFather1" runat="server">Gender</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome2" runat="server">Registration No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblRegistration" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Roll No.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblRollNo" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome3" runat="server">Year of Admission</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAdmission" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        Year of Passing</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblPassing" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Course</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblCourse" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblIncome1" runat="server">Last Exam Date</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblLeaving" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Father" runat="server">Father Name</asp:Label>
                                                    </td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                        <asp:Label ID="lblCategory3" runat="server">Exam. Result</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDetails" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">Email ID</td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblCategory2" runat="server">Name of College</asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblInstitute" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">Subject 1</td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubject1" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Subject 2</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubject2" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">Subject 3</td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubject3" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Subject 4</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubject4" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblCategory5" runat="server">Reason</asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblReason" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblapplicant_address" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2" style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label20" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label21" runat="server">Village</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                        <asp:Label ID="lblvillage" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label23" runat="server">Block</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                                        <asp:Label ID="lbltaluka" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label30" runat="server">District</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lbldist" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblpin" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                            <table cellpadding="0" cellspacing="0" width="100%" style="display: none;">
                                                <tr>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 10px;">Sl. </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; width: 125px;">Document Name </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;">Particulars of document </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">1.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; white-space: nowrap;">Educational Certificate</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">2. </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; white-space: nowrap;">Registration Card</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                            </table>
                                            <asp:GridView ID="grdView" runat="server" CellPadding="3" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="100%">
                                            </asp:GridView>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important; display: none"></asp:Label>
                                                    </b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblAppID" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction ID</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;"></span></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;"></span></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Payment Status</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblPayStatus" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Rs.
                                                        <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Amount in words</td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAmtWord" runat="server" Text=""></asp:Label>&nbsp;</td>
                                                </tr>
                                            </table>
                                            <br />
                                            <div class="row" id="marksDtlTble" runat="server">


                                                <table cellpadding="0" cellspacing="0" width="100%" style="">
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>
                                                            <asp:Label ID="lblstatus" runat="server" CssClass="lbl_value" Text=""></asp:Label></b></td>
                                                    </tr>
                                                </table>
                                                <div class="col-lg-12 box-container">
                                                    <div class="table-responsive" style="height: 100px; font-family: Arial, Helvetica, sans-serif;">
                                                        <asp:GridView ID="Gridview1" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-bordered legacysearch_tble" Width="100%" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No.">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblActionDate" runat="server" Text='<%#Eval("ActionDate") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Department Remarks">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDepartmentRemarks" runat="server" Text='<%#Eval("DepartmentRemarks") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                                        </asp:GridView>
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div style="text-align: center; margin-bottom: 10px; margin-top: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-primary" style="background-color: #0040FF !important; padding: 10px; color: #fff; border: none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
