<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SemesterResult.aspx.cs" Inherits="CitizenPortal.WebApp.Result.SemesterResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Semester Result</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/gh/davidshimjs/qrcodejs/qrcode.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <style>
        @media (max-width: 1000px) {
            .chngemob {
                margin-right: 35px !important;
                font-size: 18px !important;
                margin-top: 10px;
                width: 90% !important;
            }

            .chngemob1 {
                font-size: 18px !important;
            }

            .hdr {
                float: none !important;
                margin-right: 0px !important;
                font-size: 20px !important;
            }
        }


        @media (max-width: 1000px) {
            .mrg {
                margin-left: 300px !important;
            }

            .imght {
                height: 45px !important;
            }

            .chngemob11 {
                font-size: 11px !important;
            }
        }

        @media (max-width: 1000px) {
            .mrg1 {
                margin-left: 50px !important;
            }
        }

        @media (max-width: 1000px) {
            .wid1 {
                width: 105% !important;
            }
        }

        @media print {
            .no-print {
                visibility: hidden;
            }
        }

        .list-group-item-danger {
            color: #060505 !important;
            background-color: transparent;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 4px solid black;
        }

        .Resulttable {
            border-spacing: 0;
            border-collapse: collapse;
            opacity: 0.8;
        }

            .Resulttable > th > td {
                border: 1px solid black;
                text-align: center;
                background: white;
            }

        .list-group-item-danger {
            color: #a94442;
            background-color: transparent;
        }
    </style>
    <script>
        $(window).on('popstate', function (e) {
            var lastEntry = customHistory.pop();
            history.pushState(lastEntry.data, lastEntry.title, lastEntry.location);
            // load the last entry
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row" id="divResult" runat="server">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title"></h4>
                    </div>
                    <div style="width: 1000px; margin: 20px auto;">
                        <div>
                            <asp:Button ID="btnbk" runat="server" Text="Back" class="btn btn-warning no-print" Style="float: right; margin-right: 16px; margin-top: 20px; display: none" OnClick="btnbk_Click" />
                        </div>
                        <div>
                            <table cellpadding="0" cellspacing="0" class="nav-justified">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>

                                    <td style="width: 100px; text-align: center">
                                        <img src="/Sambalpur/img/sambalpur-university-logo.png" /></td>
                                    <td style="white-space: nowrap; text-align: center; font-size: 25px; font-weight: bold">CHHATTISGARH SWAMI VIVEKANAND TECHNICAL UNIVERSITY, BHILAI</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center" colspan="2">
                                        <div class="mrg" style="margin: 0 auto; font-weight: 700; border: 1px solid black; width: 362px; text-align: center; }">TABULATION OF RESULT(TR SHEET)</div>
                                    </td>
                                </tr>
                            </table>


                        </div>
                        <hr />
                        <div class="heading" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: right;">
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-2 col-sm-4 col-xs-2 chngemob11">
                                <label style="line-height: 23px;">STUDENT NAME:</label>
                                <%--<asp:Label runat="server" ID="NOC"></asp:Label>--%>
                                <br />
                                <label style="line-height: 23px;">COURSE&nbsp;/&nbsp;BRANCH:</label>
                                <%--<asp:Label runat="server" ID="NOEx"></asp:Label>--%>
                                <br />
                                <label style="line-height: 23px;">SEM&nbsp;/&nbsp;LEVEL&nbsp;/&nbsp;YEAR:</label>
                                <%--<asp:Label runat="server" ID="sem"></asp:Label>--%>
                                <br />
                                <label style="line-height: 23px;">ROLL NUMBER:</label>
                                <%--<asp:Label runat="server" ID="roll_no"></asp:Label>--%>
                                <br />
                                <label style="margin-right: 26px;">INSTITUTE NAME:</label>
                                <%--<asp:Label runat="server" ID="NOI"></asp:Label>--%>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-5 chngemob11">
                                <asp:Label runat="server" ID="NOC" Style="line-height: 28px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="NOEx" Style="line-height: 27px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="sem" Style="line-height: 23px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="roll_no" Style="line-height: 34px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="NOI" Style="line-height: 30px;"></asp:Label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2 chngemob11">
                                <label style="line-height: 23px;">FATHER'S NAME:</label>
                                <br />
                                <label style="line-height: 23px;">EXAM SESSION:</label>
                                <br />
                                <label style="line-height: 23px;">EXAM TYPE:</label>
                                <br />
                                <label style="line-height: 23px;">ENROLLMENT No:</label>
                            </div>
                            <div class="col-md-4 col-sm-2 col-xs-3 chngemob11">
                                <asp:Label runat="server" ID="Fname" Style="line-height: 26px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="ext" Style="line-height: 23px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblstat" Style="line-height: 34px;"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="enroll" Style="line-height: 25px;"></asp:Label>
                            </div>
                            <div class="text-center">
                            </div>
                        </div>
                        <table class="table table-bordered table-striped Resulttable">
                            <%--<td style="width: auto" class="list-group-item-danger">--%>
                            <asp:GridView runat="server" ID="GdUnReport" AutoGenerateColumns="false"
                                EmptyDataRowStyle-BackColor="green" DataKeyNames=""
                                EmptyDataText="Record Not Found" OnRowDataBound="GdUnReport_RowDataBound"
                                CssClass="table table-striped table-hover">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table_04" HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle CssClass="table_02" HorizontalAlign="Left"></ItemStyle>
                                    </asp:TemplateField>
                                   <asp:BoundField DataField="Subject_code" HeaderText="Code" />
                        <asp:BoundField DataField="Subjectname" HeaderText="Subject" />
                        <asp:BoundField DataField="maxese" HeaderText="MAX" />
                        <asp:BoundField DataField="maxesetimes" HeaderText="OBT" /><%--NullDisplayText="AB"--%>
                        <asp:BoundField DataField="maxct" HeaderText="MAX" />
                        <asp:BoundField DataField="max_ctobt" HeaderText="OBT" />
                        <asp:BoundField DataField="maxta" HeaderText="MAX" />
                        <asp:BoundField DataField="max_taobt" HeaderText="OBT" />
                        <asp:BoundField DataField="total" HeaderText="MAX" />
                        <asp:BoundField DataField="totalobt" HeaderText="OBT" />
                        <asp:BoundField DataField="LetterGrade" HeaderText="Letter Grade" />
                        <asp:BoundField DataField="gradepoint" HeaderText="Grade Point" />
                        <asp:BoundField DataField="CreditPoint" HeaderText="Credit Point" />
                                </Columns>
                                <EmptyDataRowStyle BackColor="green" />
                            </asp:GridView>
                            <%--</td>--%>
                        </table>
                        <hr />
                        <div class="row" style="width: 1000px; margin: 0 auto;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <asp:Label ID="SPIlbl" runat="server" Style="font-weight: 600;">SPI:</asp:Label>
                                <asp:Label ID="spi" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="display:none">
                                <label style="font-weight: 600;">CPI:</label>
                                <asp:Label runat="server" ID="cpivalue"></asp:Label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2"></div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="width: 16%;"></div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="width: 5%;">
                                <asp:Label runat="server" ID="mxmarks"></asp:Label>
                            </div>
                            <div class="col-md-1 col-sm-2 col-xs-2" style="width: 7%;">
                                <asp:Label runat="server" ID="obtmarks"></asp:Label>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1"></div>
                            <div class="col-md-2">
                                <asp:Label ID="rslt" runat="server" Style="font-weight: 600;">RESULT :</asp:Label>
                                <asp:Label ID="Result" runat="server" Style="font-weight: 600;"></asp:Label>
                            </div>
                        </div>
                        <hr style="margin-top: 1px;" />
                        <div style="width: 1000px; margin: 20px auto;">
                            <div style="margin-bottom: 5px">
                                <asp:Label runat="server" ID="date"></asp:Label>
                                <img src="../../PortalImages/signature.jpg" style="margin-top: -16px; margin-right: 89px; height: 34px; float: right" />
                            </div>
                            <div>
                                <b>This is a Computer Generated Document</b>
                                <b style="float: right; margin-right: 20px;">Exam Controller Signature</b>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" runat="server" visible="false">
                                <div class="col-md-4 col-sm-4 col-xs-4" style="width: 38%">
                                    <asp:Label ID="tomw" runat="server">Total Marks In Words :</asp:Label>
                                    <asp:Label ID="mkstot" runat="server" Style="font-weight: 600;"></asp:Label>&nbsp;<b>ONLY.</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4">
                                    <asp:TextBox ID="txtdivident" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtdivisor" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtcurrsemdividenr" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtcurrsemdivis" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4" style="float: right">
                                    <asp:Label ID="lblfig" runat="server">In Figure:</asp:Label>
                                    <asp:Label ID="totfig" runat="server" Style="font-weight: 600;"> </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4" runat="server" visible="false">
                                <asp:Label ID="lbtce" runat="server">Total Credits Earned:</asp:Label>
                                <asp:Label ID="tocrearn" runat="server" Style="font-weight: 600;"></asp:Label><br />
                                <br />
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4" runat="server" visible="false"> 
                                <asp:Label ID="DIvi" runat="server">Division:</asp:Label>
                                <asp:Label ID="lbDiv" runat="server" Style="font-weight: 600;"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>

                    <div class="clearfix">
                    </div>
                </div>
                <div>
                <asp:Button ID="printButton"  runat="server" Text="Print Result" OnClientClick="javascript:window.print();" CssClass="btn btn-success no-print" />
            &nbsp;
                <asp:Button ID="btnHome"  runat="server" Text="Back to Dashboard" CssClass="btn btn-primary no-print" OnClick="btnHome_Click" />
                </div>
                    <br /><br />
            </div>
        </div>
    </form>
</body>
</html>
