<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ConfigurationMaster.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.ConfigurationMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Configuration Master
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding:10px; overflow-y: auto;">
                        
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Both" OnRowCancelingEdit="grdView_RowCancelingEdit" OnRowEditing="grdView_RowEditing" OnRowUpdating="grdView_RowUpdating" CssClass="table table-striped table-bordered" Width="90%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="SrNo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Config. Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConfig" runat="server" Text='<%# Eval("ConfigurationType").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Semester">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSEM" runat="server" Text='<%# Eval("Semester").ToString() %>'></asp:Label>
                                        <asp:DropDownList ID="ddlSEM" runat="server">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="ENROL">ENROLL</asp:ListItem>                                            
                                            <asp:ListItem Value="1SEM">1SEM</asp:ListItem>
                                            <asp:ListItem Value="2SEM">2SEM</asp:ListItem>
                                            <asp:ListItem Value="3SEM">3SEM</asp:ListItem>
                                            <asp:ListItem Value="4SEM">4SEM</asp:ListItem>
                                            <asp:ListItem Value="5SEM">5SEM</asp:ListItem>
                                            <asp:ListItem Value="6SEM">6SEM</asp:ListItem>
                                            <asp:ListItem Value="REGD">REGD</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("StartDate").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("EndDate").ToString() %>'></asp:Label>
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

                    <div class="clearfix"></div>
                </div>

            </div>
            <%---Start of Button----%>
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">                    
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                        CssClass="btn btn-danger" PostBackUrl=""
                        Text="Cancel" />                   
                </div>
            </div>
            <div class="clearfix">
            </div>
            <%---End of Button----%>
           
        </div>
    </div>
</asp:Content>
