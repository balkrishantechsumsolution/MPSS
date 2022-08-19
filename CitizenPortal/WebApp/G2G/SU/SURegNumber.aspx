<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="SURegNumber.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.SURegNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Register Number Generation</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCollege">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" Width="95%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlBranch">
                                    Branch/Cource Name
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSubject">
                                    Subject Name</label>
                                <asp:UpdatePanel ID="UpdtBranch" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                            <asp:ListItem>Select Subject</asp:ListItem>
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlBranch" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlYear">
                                    Acadmic Year
                                </label>
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Year" Value="0"> </asp:ListItem>         
                                    <asp:ListItem Text="2016" Value="2016" > </asp:ListItem>                          
                                    <asp:ListItem Text="2017" Value="2017" Selected="True"> </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlRollNo">
                                    Filter By</label>
                                <asp:DropDownList ID="ddlRollNo" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Reg Genrated" Value="0"> </asp:ListItem>
                                    <asp:ListItem Text="Reg Not Genrated" Value="1" Selected="True"> </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Filter Count/Total Count
                                </label>
                                <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                    55 / 300
                                </label>
                                <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="float: right;">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 box-container mtop20">
                            <div class="box-heading">
                                <h4 class="box-title register-num">List of Student
                                </h4>
                            </div>
                            <div class="table-responsive" style="overflow-y: auto;">
                                <asp:GridView ID="DataGridView" runat="server" CssClass="table table-striped table-bordered" Width="100%"
                                    AutoGenerateColumns="false" OnRowDataBound="DataGridView_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <%--<asp:CheckBox ID="checkAll" runat="server" onclick="checkAll(this);" ClientIDMode="Static" />--%>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" ClientIDMode="Static" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sl No">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                                <asp:HiddenField ID="HDFAppID" runat="server" Value='<%#Eval("AppID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registartion No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegNo" runat="server" Text='<%#Eval("RegNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Roll No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAdmissionNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranchName" runat="server" Text='<%#Eval("BranchCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="College">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollege" runat="server" Text='<%#Eval("CollegeCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HPLReciept" runat="server" NavigateUrl='<%# string.Format("~/WebApp/Kiosk/CBCS/RegistrationReceipt.aspx?AppId={0}&SvcID={1}",
                                                      HttpUtility.UrlEncode(Eval("AppID").ToString()),HttpUtility.UrlEncode("449")) %>'
                                                    Text="View"
                                                    onclick="window.open (this.href, 'popupwindow',  'width=850,height=500,scrollbars,resizable'); return false;" Target="_blank" Font-Underline="true" ToolTip="View Action"></asp:HyperLink>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="BtnSaveRollNo" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                        Text="Save Registration No" OnClick="BtnSaveRollNo_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
