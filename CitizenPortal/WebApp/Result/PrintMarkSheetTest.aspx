<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintMarkSheetTest.aspx.cs" Inherits="CitizenPortal.WebApp.Result.PrintMarkSheetTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body div {
            border: 0px solid red
        }
    </style>

    <script>
        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById('divPrint');
            var WinPrint = window.open('', '', 'left=0,top=0,width=900,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div style="width: 100%; margin: 0 auto; border: 1px solid #808080; overflow: auto; display: block">

            <div id="divPrint" style="margin: 0 auto; width: 775px; border: 1px solid #ccc" align="left">

                <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ExamYear").ToString() %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                <tr>
                                    <td style="font-size: 12px; width: 200px; text-align: left">NAME OF THE EXAMINATION: 
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase; width: 25%">
                                        <b>
                                            <asp:Label ID="lblprogramname" runat="server" Text='<%# Eval("programname").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase; width: 50px">&nbsp;</td>
                                    <td style="font-size: 12px; width: 85px">SEMESTER:
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                        <b>
                                            <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="font-size: 12px; width: 85px;">SESSION: 
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; width: 110px;">
                                        <b>
                                            <asp:Label ID="lblexamsession" runat="server" Text='<%# Eval("examsession").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; width: 85px; text-align: right" rowspan="4">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; height: 100px; -webkit-print-color-adjust: exact;" id="ProfilePhoto" /></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 12px;">NAME OF THE CANDIDATE:
                                    </td>

                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                        <b>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("name").ToString() %>'></asp:Label>
                                        </b>
                                    </td>

                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">&nbsp;</td>
                                    <td style="font-size: 12px;">ROLL NO: 
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; width: 120px">
                                        <b>
                                            <asp:Label ID="lblRollNo" runat="server" Text='<%# Eval("RollNo").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="font-size: 12px; white-space: nowrap">ENROLL NO: 
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                        <b>
                                            <asp:Label ID="lblEnrollmentNo" runat="server" Text='<%# Eval("EnrollmentNo").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 12px; white-space: nowrap">FATHER'S/HUSBAND'S NAME:
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                        <b>
                                            <asp:Label ID="lblFather" runat="server" Text='<%# Eval("Father").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                    <td style="font-size: 12px;">STATUS:
                                    </td>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                        <b>
                                            <asp:Label ID="lblstat" runat="server" Text='<%# Eval("ExamType").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 12px;">NAME OF INSTITUTION: 
                                    </td>
                                    <td colspan="6" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                        <b>
                                            <asp:Label ID="lblNOI" runat="server" Text='<%# Eval("collegename").ToString() %>'></asp:Label>
                                        </b>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td>

                            <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                <tr>
                                    <td colspan="21">
                                        <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="5" style="text-align: center;">S.NO</td>
                                    <td rowspan="5" style="text-align: center">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td rowspan="5" style="text-align: center;">CODE</td>

                                    <td style="text-align: center; width: 30%" rowspan="5">SUBJECT</td>
                                    <td style="text-align: center" rowspan="5">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td colspan="6" style="text-align: center">EXAMINATION</td>
                                    <td style="text-align: center" rowspan="5">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td colspan="2" style="text-align: center" rowspan="3">TOTAL MARKS</td>
                                    <td style="text-align: center" rowspan="5">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td style="text-align: center" rowspan="5">LETTER<br />
                                        GRADE</td>
                                    <td style="text-align: center" rowspan="5">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td style="text-align: center" rowspan="5">GRADE<br />
                                        POINT</td>
                                    <td style="text-align: center" rowspan="5">
                                        <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                        </div>
                                    </td>
                                    <td style="text-align: center" rowspan="5">CREDITS<br />
                                        EARNED</td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div style="font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">ESE</td>
                                    <td colspan="2" style="text-align: center">CT</td>
                                    <td colspan="2" style="text-align: center">TA</td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div style="font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">MAX </td>
                                    <td style="text-align: center;">OBT</td>
                                    <td style="text-align: center;">MAX </td>
                                    <td style="text-align: center;">OBT</td>
                                    <td style="text-align: center;">MAX</td>
                                    <td style="text-align: center;">OBT</td>
                                    <td style="text-align: center;">MAX</td>
                                    <td style="text-align: center;">OBT</td>
                                </tr>
                                <tr>
                                    <td colspan="21">
                                        <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                            CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="margin-bottom: 100px">
                                <asp:GridView runat="server" ID="GrdRslt" AutoGenerateColumns="false"
                                    EmptyDataRowStyle-BackColor="green" DataKeyNames="" BorderColor="transparent"
                                    EmptyDataText="Record Not Found" ShowHeader="False" rules="all"
                                    CssClass="table table-striped table-hover" Width="1000px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No." HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="table_04 notop" HorizontalAlign="Left"></HeaderStyle>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Subject_code" HeaderText="Code"></asp:BoundField>
                                        <asp:BoundField DataField="SubjectName" HeaderText="Code" ItemStyle-Width="195px"></asp:BoundField>
                                        <asp:BoundField DataField="maxese" HeaderText="MAX" ItemStyle-Width="10px"></asp:BoundField>
                                        <asp:BoundField DataField="maxesetimes" HeaderText="OBT"></asp:BoundField>
                                        <asp:BoundField DataField="maxct" HeaderText="MAX" ItemStyle-Width="10px"></asp:BoundField>
                                        <asp:BoundField DataField="max_ctobt" HeaderText="OBT"></asp:BoundField>
                                        <asp:BoundField DataField="maxta" HeaderText="MAX" ItemStyle-Width="10px"></asp:BoundField>
                                        <asp:BoundField DataField="max_taobt" HeaderText="OBT"></asp:BoundField>
                                        <asp:BoundField DataField="total" HeaderText="MAX" ItemStyle-Width="10px"></asp:BoundField>
                                        <asp:BoundField DataField="totalobt" HeaderText="OBT">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LetterGrade" HeaderText="Letter Grade">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gradepoint" HeaderText="Grade Point">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CreditPoint" HeaderText="Credit Point">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataRowStyle BackColor="green" />
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%; margin-top: 10px">
                                <tr>
                                    <td style="width: 70%; font-size: 13px; padding-left: 28px;">Total Marks In Words :  <b style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                        <asp:Label runat="server" ID="totmks"></asp:Label>
                                        ONLY</b>
                                    </td>
                                    <td style="font-size: 13px;">In Figure :<b><asp:Label runat="server" ID="infig"></asp:Label></b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                <tr>
                                    <td style="width: 70%">
                                        <div style="font-size: 13px; padding-left: 28px;">
                                            Total Credits Earned: <b style="font-family: Arial, Helvetica, sans-serif;">
                                                <asp:Label ID="totCredits" runat="server"></asp:Label>
                                            </b>
                                        </div>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="width: 150px;">
                                        <div style="font-size: 13px; width: 100px">
                                            SPl : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                <asp:Label ID="lblSpi" runat="server"></asp:Label></b>
                                        </div>
                                    </td>
                                    <td style="width: 150px;">
                                        <div style="font-size: 13px;">
                                            CPI : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                <asp:Label ID="lblCPI" runat="server"></asp:Label>
                                            </b>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="width: 150px;">
                                        <div>
                                            Result : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                <asp:Label ID="lblResult" runat="server"></asp:Label>
                                            </b>
                                        </div>
                                    </td>
                                    <td style="width: 150px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="width: 150px;">
                                        <div>
                                            Division : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                <asp:Label runat="server" ID="LblDivision" Style="position: absolute"></asp:Label>
                                            </b>
                                        </div>
                                    </td>
                                    <td style="width: 150px;">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="bottom: 0; vertical-align: bottom">
                            <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                <tr>
                                    <td style="vertical-align: top">
                                        <table style="border: 1px solid black; border-collapse: collapse; font-size: 11px;">
                                            <tr>
                                                <td colspan="2" style="text-align: center; border: 1px solid black; border-collapse: collapse;">Grace Marks
                                                </td>
                                                <td colspan="2" style="text-align: center; border: 1px solid black; border-collapse: collapse;">Semester Total of Marks
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">Subject Code
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">Subject Code
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">Maximum
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">Obtained
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="sub1"></asp:Label></b>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="sub2"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; text-align: center; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="total"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; text-align: center; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="totalobt"></asp:Label></b>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table runat="server" id="totalsems" style="border: 1px solid black; border-collapse: collapse; font-size: 13px;">
                                            <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                <td style="border: 1px solid black; border-collapse: collapse;">SEM
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">1
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">2
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">3
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">4
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">5
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">6
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">7
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">Final
                                                </td>
                                            </tr>
                                            <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                <td style="border: 1px solid black; border-collapse: collapse;">MARKS
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt1"></asp:Label>
                                                    </b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt2"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt3"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt4"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt5"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt6"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="obt7"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="totalofallsem"></asp:Label></b>
                                                </td>
                                            </tr>
                                            <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                <td style="border: 1px solid black; border-collapse: collapse;">OUT OF
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot1"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot2"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot3"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot4"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot5"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot6"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="tot7"></asp:Label></b>
                                                </td>
                                                <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label runat="server" ID="totalsumofsem"></asp:Label></b>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                    <td style="text-align: center; vertical-align: bottom; width: 150px">
                                        <div style="margin: 0 auto; height: 110px; width: 110px; border: 1px solid #808080">
                                            &nbsp;<%--<uc1:qrcode id="QRCode1" runat="server" />--%>
                                        </div>
                                    </td>
                                    <td style="width: 300px">
                                        <div style="float: right">
                                            <p style="margin-bottom: 4px; font-size: 15px; text-align: center">Abbreviation</p>
                                            <table style="border: 1px solid black; border-collapse: collapse; height: 170px; font-size: 10px; width: 271px;">
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;*  
                                                    </td>
                                                    <td>Indicates the number of extra attempts after the 1° regular one
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;@/RT
                                                    </td>
                                                    <td>Indicates Marks/Result after Retotalling
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;#/RV
                                                    </td>
                                                    <td>Indicates Marks/Result after Revaluation
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;$/RRV
                                                    </td>
                                                    <td>Indicates Marks/Result after Re-revaluation
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;^/ABR
                                                    </td>
                                                    <td style="white-space: nowrap;">Indicates Marks/Result after Appelcate Body Review
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;G
                                                    </td>
                                                    <td>Indicates grace marks in the Subject(s)
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;ABS
                                                    </td>
                                                    <td>Indicates ‘Absent’ in the Subject(s)
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;F
                                                    </td>
                                                    <td>Indicates failure in the Subject(s) Total
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;ESE
                                                    </td>
                                                    <td>End Semester Exam
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;CT
                                                    </td>
                                                    <td>Class Tests
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;SPI
                                                    </td>
                                                    <td>Semester Performance Index
                                                    </td>
                                                </tr>
                                                <tr style="line-height: 1.4;">
                                                    <td>&nbsp;CPI
                                                    </td>
                                                    <td>Cumulative Performance Index
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 33%; text-align: left; font-size: 13px;">Issued through the Principal<br />
                                        With Seal and Signature
                                    </td>
                                    <td style="text-align: center; width: 34%; white-space: nowrap">
                                        <span style="font-size: 13px;">Date :</span>
                                        <asp:Label ID="DateResult" runat="server" Text='<%# Eval("ResultDate").ToString()%>'></asp:Label>
                                        <br />
                                        For details of Grading System & other rules see overleaf
                                    </td>
                                    <td style="width: 33%; font-size: 15px; bottom: 0; text-align: right">
                                        <b>Examination Controller </b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div style="margin: 0 auto; text-align: center">
            <input type="button" id="btnPrint" style="background-color: #0040FF; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
