<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="MPSSReports.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.MPSSReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .GridClass {
            width: 100%;
            font-family: tahoma;
        }

            .GridClass td /* this applies to the Gridviews Data fileds */ {
                padding: 1px;
                text-align: center;
                width: 3%;
                border: solid 1px black;
                border-collapse: collapse;
            }

            .GridClass th /* this applies to the Gridviews Headers */ {
                padding: 0px 0px;
                border-width: 1px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Report Viewer</h2>
            </div>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Report Filters
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="box-container">

                        <div class="box-body box-body-open ptop20">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label class="manadatory">Financial Year</label>

                                    <asp:DropDownList ID="ddlFinancialYr" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="2022">2022</asp:ListItem>
                                        <asp:ListItem Value="2021">2021</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label class="manadatory">Report Type</label>

                                    <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="1">ScholarShip?registration</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip="Show Data"
                                        CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnSubmit_Click" />

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="box-container">
                    <div class="box-heading">

                        <h4 class="box-title">MPSS Reports Data</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <div class="demo-container">
                                    <asp:GridView ID="GridView1" CssClass="GridClass" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="10"
                                        CellSpacing="5" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="StudentID" HeaderText="ID" />
                                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                                            <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                                            <asp:BoundField DataField="MotherName" HeaderText="Mother Name" />
                                            <asp:BoundField DataField="Birthdate" HeaderText="Birth date" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                             <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                                            <%--  <asp:BoundField DataField="BankAccountNo" HeaderText="Account No" />
                                            <asp:BoundField DataField="BankAccountIFSCCode" HeaderText="IFSC Code" />--%>


                                            <%--  <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Text="View" CommandName="ViewAcknowledge" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField ShowHeader="true" HeaderText="View">
                                                <ItemTemplate>
                                                    <%-- <asp:HyperLink ID="lb_View" runat="server" 
                                                        CommandName="ViewAcknowledge" Text="View" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'></asp:HyperLink>--%>
                                                    <asp:LinkButton ID="lb_View" runat="server" CommandName="ViewAcknowledge" Text="View" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'>  
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
                                        <RowStyle ForeColor="#000066" />

                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="mtop15"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
