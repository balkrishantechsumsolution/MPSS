<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="BankDetail.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.BankDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Bank Detail</h2>
                </div>
            </div>
            
            <div class="row" runat="server" id="divBank">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Enter College Bank Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label style="color:maroon;font-size:15px;">Please Enter Correct Information. You'll able to submit the detail only once, no edit functionality shall be provided</label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Account Holder's Name</label>
                                <div class="col-xs-12 pleft0">
                                     <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select College" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Account Holder's Name</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Name of Account Holder"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic"
                                        ErrorMessage="Please enter Name of Account Holder" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Bank Account No.</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtAccount" CssClass="form-control" runat="server" placeholder="Bank Acount No." TextMode="Password" 
                                        ncopy="return false;" oncut="return false;" onpaste="return false;" autocomplete="new-password"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAccount" Display="Dynamic"
                                        ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Re Enter Bank Account No.</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtReAccount" CssClass="form-control" runat="server" placeholder="Bank Acount No."
                                        ncopy="return false;" oncut="return false;" onpaste="return false;" ></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReAccount" Display="Dynamic"
                                        ErrorMessage="Please Re-enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        

                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="form-group">
                                <label class="manadatory">Name of the Bank</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlBank" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select College" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">IFSC Code</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtIFSCCode" CssClass="form-control" runat="server" MaxLength="11" placeholder="Mobile No."></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtIFSCCode" Display="Dynamic"
                                        ErrorMessage="Please enter IFSC Code" ValidationGroup="G" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtIFSCCode" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid IFSC Code" ValidationExpression="^[A-Za-z]{4}0[A-Z0-9a-z]{6}$" EnableTheming="True" ></asp:RegularExpressionValidator>
                                </div>

                            </div>

                        </div>
                        <%--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">District</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Block/Taluka
                                </label>
                                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvBlock" runat="server" ControlToValidate="ddlBlock" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Block." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory text-nowrap" for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvVillage" runat="server" ControlToValidate="ddlVillage" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Village/City." ValidationGroup="G" ForeColor="Red" />
                                </div>

                            </div>
                        </div>--%>
                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="form-group">
                                <label class="manadatory">Bank Address</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic"
                                        ErrorMessage="Please Enter Address of the teacher" ValidationGroup="G" ForeColor="Red" />
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtPin">
                                    Pin Code
                                </label>
                                <asp:TextBox ID="txtPin" CssClass="form-control" runat="server" MaxLength="6" placeholder="Pin No."></asp:TextBox>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtPin" Display="Dynamic"
                                        ErrorMessage="Please select Pin Code." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>


            <%---Start of Button----%>
            <div class="row" runat="server" id="divBtn">
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                            CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="G" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                            CssClass="btn btn-danger" PostBackUrl=""
                            Text="Cancel" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>
    </div>
</asp:Content>
