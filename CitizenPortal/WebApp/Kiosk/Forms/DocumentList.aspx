<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Profile/Master/Home.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.DocumentList" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:Infomation runat="server" ID="Infomation" />--%>
        <%---Start of Instruction----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Required Documents for Senior Citizen Certificate
                    </h4>
                </div>
                <div class="">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Instructions</span>
                            <ul class="">
                                <li>All asterisk (*) marked field are mandatory
                                </li>
                                <li>UID / Voter Id No / PAN No is mandatory
                                </li>
                            </ul>
                        </li>
                        <li class="list-group-item list-group-item-success">
                            <span class=""><i class="fa fa-gear fa-fw"></i>Applicant Photograph</span>
                            <ul class="">
                                <li>The file format needs to be in .bmp / .jpg / .png
                                </li>
                                <li>Size Photograph should be between 5KB to 500KB.
                                </li>
                                <li>The width of the photograph should be 160 pixels
                                </li>

                            </ul>
                        </li>
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Verification</span>
                            <ul class="">
                                <li>Verify the mobile and email id, through verification code send through SMS and email
                                </li>
                                <li>Enter the captcha to verify youself
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Instruction-----%>

        <%---Start of Identity----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num manadatory">Identity Proof (any one)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                1) Pan card
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                2) Passport
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                3) RSBY card
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                4) Aadhar Card
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                5) Voter ID card 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                               6) NREGA Job card 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                7) Driving Licence 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                8) Applicants Photograph 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                9) Semi government ID card
                            </label>
                        </div>
                    </div>                    
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Identity-----%>

        <%---Start of Address----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num manadatory">Address Proof (any one)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                1) Passport 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                2) Ration Card 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                3) Rent Receipt 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                4) Telephone Bill 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                5) Electricity Bill 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                               6) Water charge Bill 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                7) Voter list Extract 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                8) 7/12 and 8-A Extract
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                 9) Property Tax Receipt 
                            </label>
                        </div>
                    </div>   
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                 10) Motor Driving Licence 
                            </label>
                        </div>
                    </div>  
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                 11) Property Registration Extract
                            </label>
                        </div>
                    </div>                 
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Address-----%>

        <%---Start of Address----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num manadatory">Age Proof - In Case of Minor (any one)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                1) Birth Certificate 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                               2) Bonafide Certificate  
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                3) School Leaving Certificate 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                               4) Primary school admission Extract 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                5) Service Book (Govt/Semi Govt Employees)
                            </label>
                        </div>
                    </div>                                 
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Address-----%>
        
        <%---Start of Residence----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num manadatory">Residence Proof - In Case of Minor (any one)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                1) Resident Certificate issued by Gramsevak 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                               2) Resident Certificate issued by Bill Collector
                            </label>
                        </div>
                    </div>                                                    
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Residence-----%>

        <%---Start of Mandatory----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num manadatory">Mandatory Documents
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                1) Self-Declaration
                            </label>
                        </div>
                    </div>                                                                      
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Residence-----%>

        <%---Start of Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Notified Service Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered">
                            </asp:GridView>
                        </div>
                    </div>                    
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Details-----%>

        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <asp:Button ID="btnProceed" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                        Text="Proceed" PostBackUrl="~/WebApp/Kiosk/Forms/SeniorCitizen.aspx" />
                    <asp:Button ID="btnPrint" runat="server" CausesValidation="False" CssClass="btn btn-success"
                        OnClientClick="javascript:return Search();" Text="Print" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                        CssClass="btn btn-danger" PostBackUrl=""
                        Text="Cancel" />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%----END of Button-----%>
    </div>
</asp:Content>
