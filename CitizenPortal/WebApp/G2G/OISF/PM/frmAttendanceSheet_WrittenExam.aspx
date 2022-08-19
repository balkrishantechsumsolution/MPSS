<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAttendanceSheet_WrittenExam.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.frmAttendanceSheet_WrittenExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Sheet Written Examination</title>
    <%--<link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />--%>

    <style>
        @media print {
            input {
                display: none;
            }
        }

                .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title" style="text-align: center"></h4>
                    </div>
                    <div class="clearfix">
                        <h2 class="form-heading">
                            <span class="col-lg-12 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o"></i>Written Examination Attendance Sheet <%--{{resourcesData.lblOISFTitle}}--%>
                            </span>
                        </h2>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                <tr>
                                    <td>Center Name:   
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpCenter" runat="server" Height="40px" Width="100%" OnSelectedIndexChanged="drpCenter_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">KIIT University, Bhubaneswar</asp:ListItem>
                                            <asp:ListItem Value="2">Barabati Stadum, Cuttack</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>

                                <tr>
                                    <td>Campus Name</td>
                                    <td>


                                        <asp:DropDownList ID="drpCampus" runat="server" Height="34px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="drpCampus_SelectedIndexChanged"></asp:DropDownList>


                                    </td>

                                </tr>

                                <tr id="ExamHall" runat="server" visible="false">
                                    <td>Examination Hall/Room No :  
                                           
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpHallNo" runat="server" Height="40px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="drpHallNo_SelectedIndexChanged"></asp:DropDownList></td>

                                </tr>

                                <tr id="RangeRow" runat="server" visible="false">
                                    <td>Range</td>
                                    <td>
                                        <asp:DropDownList ID="drpRange" runat="server" Height="40px" Width="405px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged"></asp:DropDownList></td>

                                </tr>

                                <tr>
                                    <td colspan="2" style="text-align: center;">


                                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />

                                    </td>

                                </tr>

                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <h4>
                                            <asp:Label ID="lblCenterName" runat="server"></asp:Label></h4>
                                    </td>

                                </tr>


                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="grdAttendanceSheet" runat="server" Width="785px" ShowHeader="False" AutoGenerateColumns="false" OnRowDataBound="grdAttendanceSheet_RowDataBound" BorderStyle="None" BorderWidth="0px">
                                            <Columns>


                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                        <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-family: Arial !important; font-size: 12px;">
                                                            <tr>
                                                                <td style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                                                    <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td rowspan="5" style="padding: 0; border: 1px solid #999; text-align: center; width: 100px">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 100px" id="ProfilePhoto" /><br />
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 115px;">
                                                                    <asp:Label ID="Label30" runat="server" Text="Roll No."></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 50px" rowspan="6">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center;">Pasport Size 
			<br />
                                                                    Photograph of 
			<br />
                                                                    Applicant to be
			<br />
                                                                    pasted here</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">
                                                                    <asp:Label ID="Label5" runat="server" Text="Reference ID"></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblReferenceId" runat="server" Text='<%# Eval("AppNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                                    <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblApplicantName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="">
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblFatherName" runat="server" Text='<%# Eval("FatherName").ToString() %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="">
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                                                    <asp:Label ID="Label29" runat="server" Text="Date of Birth (Age)"></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="">
                                                                <td rowspan="2" style="padding: 0; border: 1px solid #999; text-align: center; width: 100px">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 100px; height: 42px;" id="Img1" /></td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;" rowspan="2">
                                                                    <asp:Label ID="Label31" runat="server" Text="">Candidate's <br/>Signature</asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;" rowspan="2">&nbsp;</td>
                                                            </tr>
                                                            <tr style="">
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: center;">
                                                                    <asp:Label ID="Label32" runat="server" Text="">Invigilator's<br />Signature</asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>
                                    </td>

                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>

                            </table>


                        </div>
                    </div>

                </div>
            </div>
        </div>


    </form>
</body>
</html>
