<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="CollegeProfile.aspx.cs" Inherits="CitizenPortal.WebApp.KIOSK.CBCS.CollegeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>College Affiliation</h2>
            </div>
        </div>
        <div class="row">
            
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Upload College Affiliation Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">College Code</label>
                            <asp:TextBox ID="txtCollege" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                             <label class="manadatory">Year of Affiliation</label>
                            <div class="col-xs-12 pleft0">
                                 <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Year--</asp:ListItem>                                     
                                     <asp:ListItem Value="2021">2021</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="col-xs-12 pleft0 p5">
                                 <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ControlToValidate="ddlYear" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Year of Affiliation." ValidationGroup="G" ForeColor="Red" />
                            </div>
                           
                           
                        </div>
                       
                    </div>
                                   
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Affiliation No.</label>
                            <div class="col-xs-12 pleft0">
                                 <asp:TextBox ID="txtAffiliationNo" CssClass="form-control" runat="server" placeholder="Affiliation No."></asp:TextBox> 
                                </div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvAffiliation" runat="server" ControlToValidate="txtAffiliationNo" Display="Dynamic"
                                    ErrorMessage="Please enter Affiliation No." ValidationGroup="G" ForeColor="Red" /> 
                                </div>
                           
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                   <div class="col-xs-12 col-sm-4 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Affiliation File</label>
                            <div class="col-xs-12 pleft0">
                                 <asp:FileUpload ID="txtFile" CssClass="form-control" runat="server" placeholder="Affiliation File"></asp:FileUpload> 
                                </div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFile" Display="Dynamic"
                                    ErrorMessage="Please select Affiliation File" ValidationGroup="G" ForeColor="Red" /> 
                                </div>
                           
                        </div>
                        
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Remark</label>
                             <div class="col-xs-12 pleft0 pright0"> <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server" MaxLength="100" placeholder="Remark if any"></asp:TextBox></div>
                            <div class="col-xs-12 pleft0 p5">
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
