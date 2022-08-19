<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AadhaarDetail.ascx.cs" Inherits="CitizenPortal.WebApp.Control.AadhaarDetail" %>
<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="row">
            <div class="form-group col-lg-3">
                <label class="manadatory" for="txtAadhaar">
                    {{resourcesData.aadhaar}}
                </label>
            </div>
            <div class="form-group col-lg-5">
                <input class="form-control" placeholder="Enter 12 digit Aadhaar No." name="txtAadhaar" type="text" value="" id="UID"
                    autofocus />
            </div>
            <div class="form-group col-lg-4 text-right">
                <%--<button type="button" class="btn btn-primary"><i class="fa fa-search"></i>  Search </button>--%>
                <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="Start eKyc" OnClientClick="return openWindow(1,2,'UIDCasteCertificate1'); " />                
            </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
