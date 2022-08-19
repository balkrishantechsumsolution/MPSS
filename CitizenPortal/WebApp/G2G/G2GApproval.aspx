<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Master/G2G.Master" AutoEventWireup="true" CodeBehind="G2GApproval.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.G2GApproval" %>

<%@ Register Src="~/WebApp/Control/G2GInfomation.ascx" TagPrefix="uc1" TagName="G2GInfomation" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pagination {
            color: #000 !important;
            display: block !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <uc1:G2GInfomation runat="server" ID="G2GInfomation" />
        <%---Start of Preview----%>
        <div class="row">
            <div class="col-md-8 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Certificate Preview
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <iframe src="../Kiosk/HTML/SeniorCitizen.html" style="height:2200px;border:none;width:100%;"></iframe>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Preview-----%>
         <%---Start of Action----%>
        <div class="row">
            <div class="col-md-4 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Certificate Preview
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
        <%----END of Action-----%>
    </div>
</asp:Content>
