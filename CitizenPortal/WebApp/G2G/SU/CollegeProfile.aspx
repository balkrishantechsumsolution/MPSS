<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="CollegeProfile.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.CollegeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Update College Profile</h2>
            </div>
        </div>
        <div class="row">
            
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Insert College Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">College Code</label>
                            <asp:TextBox ID="txtCollegeCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">College Name</label>
                            <asp:TextBox ID="txtCollege" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                             <label class="manadatory">District</label>
                            <div class="col-xs-12 pleft0">
                                 <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select District--</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="col-xs-12 pleft0 p5">
                                 <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                            </div>
                           
                           
                        </div>
                       
                    </div>
                    
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Affiliation Type</label>
                            <div class="col-xs-12 pleft0 pright0">
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Affilation Type--</asp:ListItem>
                                <asp:ListItem Value="Y" Selected="True">Approved</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Affiliation Type." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-6 pright0">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <div class="col-xs-12 pleft0"> <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="70" placeholder="College Email ID"></asp:TextBox></div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Please College Email ID." ValidationGroup="G" ForeColor="Red" />
                            </div>
                           
                        </div> 
                    </div>
                   
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <div class="col-xs-12 pleft0">
                                 <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox> 
                                </div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic"
                                    ErrorMessage="Please enter College Contact No." ValidationGroup="G" ForeColor="Red" /> 
                                </div>
                           
                        </div>
                        
                    </div>
                    
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label>Phone No.</label>
                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" MaxLength="15" placeholder="Phone No."></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label>Address</label>
                             <div class="col-xs-12 pleft0 pright0"> <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox></div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic"
                                    ErrorMessage="Please College Address" ValidationGroup="G" ForeColor="Red" />
                            </div>
                           
                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                </div>
            <%---Start of Button----%>
            <div class="col-md-12 box-container" runat="server" id="divBtn">
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
            <%---End of Button----%>
        </div>
    </div>
</asp:Content>
