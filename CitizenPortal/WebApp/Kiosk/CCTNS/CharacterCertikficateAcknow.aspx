<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CharacterCertikficateAcknow.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CCTNS.CharacterCertikficateAcknow" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        .headerstyle {
            color: #404040;
            padding: 5px;
            text-align: center;
            width: 30%;
        }

        #grdPlotDtl th, #grdView th {
            padding: 5px;
        }

        #grdPlotDtl td, #grdView td {
            padding: 5px;
        }

        .p5 {
            padding: 5px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 900px;">
                    <div style="margin: 0 auto; height: auto; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: auto; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 785px; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                </div>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Charactor Certificate Acknowledgement</asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px"></span>

                            </div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
                            <div style="margin: 10px auto; width: 708px; font-size: 13px;">

                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <b>Applicant Details</b></td>
                                        <%--<td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <%--  <b>Status : </b>
                                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                        </td>--%>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="lblAppnametxt" runat="server" Text="Applicant Name"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label2" runat="server" Text="Relation With Beneficiary"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBnfsryRelsn" runat="server"></asp:Label>
                                        </td>
                                        <td rowspan="5" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 135px;" id="ProfilePhoto" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label9" runat="server" Text="Beneficiary Name"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBnfsryName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label11" runat="server">Gender</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label12" runat="server" Text="Father Name"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label25" runat="server">Mother Name</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label10" runat="server" Text="Email ID"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label22" runat="server" Text="Apply Purpose"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblPurpose" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <b>
                                                <asp:Label ID="Label6" runat="server" Text="ModeOfReceiving"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblModeOfReceiving" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;"></td>

                                    </tr>


                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <asp:Label ID="lblapplicant_address" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;" rowspan="5">
                                            <b>
                                                <asp:Label ID="Label20" runat="server" Text="Care Of /&lt;br/&gt; House / Apartment No.&lt;br/&gt;Road / Street Name "></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label21" runat="server">State</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblState" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label23" runat="server">District</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                            <asp:Label ID="lblDistrict" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label4" runat="server">Subdivision</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblSubdivision" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label5" runat="server">Panchayat</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPanchayat" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label19" runat="server">Police Station</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPoliceStation" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <b>
                                                <asp:Label ID="Label24" runat="server">PinCode</asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPinCode" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="tblDoc" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                    <tr style="background-color: #c1c1c1">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView runat="server" ID="grdView" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" Width="100%" CssClass="p5">
                                                <HeaderStyle CssClass="headerstyle" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SR.NO." ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="DocDesc" HeaderText="Document Name" ItemStyle-Width="70%" />
                                                    <asp:TemplateField HeaderText="Particulars of document" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%# Eval("IsUploaded").ToString() == "1" ? "Attached" : "Not Attached" %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="tblPay" runat="server" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0">
                                    <tr style="width: 100%; border: 0; background-color: #c1c1c1">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Payment Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label1" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblAppID" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <b>
                                                <asp:Label ID="Label3" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label></b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblAppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Transaction ID</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Transaction Date</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Total Amount</b></td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>Rs. 
                                            <asp:Label ID="lblTotalFee" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblAmt" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 50px;">
                            </div>
                        </div>
                    </div>
                </div>

                <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                    <asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" ToolTip="Back to Home Page" Text="Home" />
                </div>

            </div>
    </form>
</body>
</html>
