<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Frm_WrittenExam_MasterDataEntry.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.Frm_WrittenExam_MasterDataEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Broad Sheet</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />

    <style>
        @media print {
            input {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title" style="text-align: center">Broad Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 100%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">

                                <tr style="text-align: left">
                                    <td>
                                        <div>

                                            <table style="">
                                                <tr>
                                                    <td>Center Name:</td>
                                                    <td>
                                                        <asp:DropDownList ID="drpCenter" runat="server" Height="40px" Width="405px" OnSelectedIndexChanged="drpCenter_SelectedIndexChanged" AutoPostBack="True">
                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">KIIT University, Bhubaneswar</asp:ListItem>
                                                            <asp:ListItem Value="2">Barabati Stadum, Cuttack</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td>Campus Name</td>
                                                    <td>
                                                        <asp:DropDownList ID="drpCampus" runat="server" Height="34px" Width="405px" AutoPostBack="True" OnSelectedIndexChanged="drpCampus_SelectedIndexChanged"></asp:DropDownList></td>
                                                </tr>
                                                <tr id="ExamHall" runat="server" visible="false">
                                                    <td>Examination Hall/Room No :                                             
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpHallNo" runat="server" Height="40px" Width="405px" AutoPostBack="True" OnSelectedIndexChanged="drpHallNo_SelectedIndexChanged"></asp:DropDownList></td>

                                                </tr>
                                                <tr id="RangeRow" runat="server" visible="false">
                                                    <td>Range</td>
                                                    <td>
                                                        <asp:DropDownList ID="drpRange" runat="server" Height="40px" Width="405px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged"></asp:DropDownList></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>

                                </tr>


                                <tr style="text-align: center">
                                    <td></td>

                                </tr>


                                <tr style="text-align: left">
                                    <td>
                                        <h4>
                                            <asp:Label ID="lblCenterName" runat="server"></asp:Label></h4>
                                    </td>

                                </tr>


                                <tr style="text-align: left">
                                    <td>
                                        </td>

                                </tr>


                                <tr>
                                    <td>
                                        <div style='overflow-x: scroll; overflow-y: scroll; width: 1200px; height: 500px;margin:0 auto;'>                                                                                                                                                              

                                            <asp:GridView ID="grdBroadSheet" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Both" OnRowCancelingEdit="grdBroadSheet_RowCancelingEdit" OnRowEditing="grdBroadSheet_RowEditing" OnRowUpdating="grdBroadSheet_RowUpdating">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>

                                                    <asp:TemplateField HeaderText="SrNo">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="APP ID">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAPPID" runat="server" Text='<%# Eval("APPID").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="ROLL No.">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblROLLNO" runat="server" Text='<%# Eval("ROLLNO").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Name">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Father's Name">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFatherName" runat="server" Text='<%# Eval("FatherName").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DOB">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Age (Y-M-D)">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Category">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Height (c.m.)">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHeight" runat="server" Text='<%# Eval("Height").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Bonus Marks in Height">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBonusHeight" runat="server" Text='<%# Eval("BonusHeight").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                    <asp:TemplateField HeaderText="Weight (k.g.)">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblWeight" runat="server" Text='<%# Eval("Weight").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Chest (c.m.)">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChest" runat="server" Text='<%# Eval("Chest").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Run (1.6 k.m.)">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRunning" runat="server" Text='<%# Eval("Running").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="High Jump">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHighJump" runat="server" Text='<%# Eval("HighJump").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Broad Jump">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBroadjump" runat="server" Text='<%# Eval("Broadjump").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rope Climbing">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRopeClimbing" runat="server" Text='<%# Eval("RopeClimbing").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Swimming">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSwimming" runat="server" Text='<%# Eval("Swimming").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Cross Country">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCrossCountry" runat="server" Text='<%# Eval("CrossCountry").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Driving">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDriving" runat="server" Text='<%# Eval("Driving").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>





                                                    <asp:TemplateField HeaderText="Educational Achievement">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtEducationalAchievement" runat="server" Text='<%# Eval("EducationalAchievement").ToString() %>' MaxLength="1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEducationalAchievement" runat="server" Text='<%# Eval("EducationalAchievement").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:HyperLinkField HeaderText="Educational Doc" DataNavigateUrlFields="EducationalDoc" DataTextField="EducationalDocText" Target="_blank" />
                                                    <asp:TemplateField HeaderText="Sport Achievement">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtSportAchievement" runat="server" Text='<%# Eval("SportAchievement").ToString() %>' MaxLength="2"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSportAchievement" runat="server" Text='<%# Eval("SportAchievement").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:HyperLinkField HeaderText="Sport Achievement Doc" DataNavigateUrlFields="SportAchievementDoc" DataTextField="SportAchievementDocText" Target="_blank" />
                                                    <asp:TemplateField HeaderText="NCC">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtNCC" runat="server" Text='<%# Eval("NCC").ToString() %>' MaxLength="1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNCC" runat="server" Text='<%# Eval("NCC").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:HyperLinkField HeaderText="NCC Doc" DataNavigateUrlFields="NCCDoc" DataTextField="NCCDocText" Target="_blank" />
                                                    <asp:TemplateField HeaderText="Written Examination">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtWrittenExam" runat="server" Text='<%# Eval("WrittenExam").ToString() %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblWrittenExam" runat="server" Text='<%# Eval("WrittenExam").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Total">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:CommandField ShowEditButton="True" />
                                                </Columns>


                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />


                                            </asp:GridView>

                                        </div>
                                    </td>

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
